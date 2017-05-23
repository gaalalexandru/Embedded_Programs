
class ST7066U  {
 
    private :
        DigitalOut *rs, *rw, *e, *db0, *db1, *db2, *db3, *db4, *db5, *db6, *db7;
        uint8_t lines_bit, font_bit;
 
    public :
    ST7066U () {
        rs = new DigitalOut(p5);
        rw = new DigitalOut(p6);
        e = new DigitalOut(p7);
        db0 = new DigitalOut(p8);
        db1 = new DigitalOut(p9);
        db2 = new DigitalOut(p10);
        db3 = new DigitalOut(p11);
        db4 = new DigitalOut(p12);
        db5 = new DigitalOut(p13);
        db6 = new DigitalOut(p14);
        db7 = new DigitalOut(p15); 
        
        font_bit = 0;
        lines_bit = 0;
        
        wait(0.040);          // LCD initialisation takes 40ms.
    }
    
    void rows(int l) {
        if(l == 1)
            lines_bit = 0;
        else if (l == 2)
            lines_bit = 8;
        
        instruction(32 | 16 | lines_bit | font_bit);
    }
    
    void font(int f) {
        if(f == 0)
            font_bit = 0;
        else if (f == 1)
            font_bit = 4;
         
        instruction(32 | 16 | lines_bit | font_bit);
    }
       
    
    void write(int c, int nrs) {
        int old_rs = rs->read();
        // Should check Busy Flag here.
        rs->write(nrs);
        e->write(1);  // E must be on for min 480ns then drop to zero.  Trigger is on falling signal.
        db0->write(c & 1);
        db1->write(c>>1 & 1);
        db2->write(c>>2 & 1);
        db3->write(c>>3 & 1);
        db4->write(c>>4 & 1);
        db5->write(c>>5 & 1);
        db6->write(c>>6 & 1);
        db7->write(c>>7 & 1);
        
        // added extra wait state
        wait(0.000001);  // Needed the equivalent of this on the Raspberry Pi.
        
        // Tdsw Data Setup Width time at least 80ns.  No need for delay on slow processor.
        e->write(0); //   = 0; // Strobe.
        // Th   Data Hold time at least 10ns.  No need for delay on slow processor.
        wait(0.000037);  // Most instructions take 37us.  May not need this delay if Busy Flag checked at top.
        rs->write(old_rs);
    }
    
    void data(uint8_t c) {
        write(c, 1); 
    }
    void instruction(uint8_t c) {
        write(c, 0);
    }
    
    void clear(void) {
        instruction(1);
        wait(0.00152); // clear takes 1.52 ms.
    }
    void home(void) {
        instruction(2); 
        wait(0.00152); // home takes 1.52 ms.
    }
    
    void str_at(const char *str, uint8_t x = 0, uint8_t y = 0) {
        uint8_t *c = (uint8_t *) str;
        ddram(y * 0x40 + x);
        for (uint8_t i = 0; i < 80 && (*c); i++) { // Will never write more than 80 chars.
            data(*c);
            c++;
        }
    }
    
    void row0(const char *str, uint8_t x = 0) {
        str_at(str, x, 0);
    }
    
    void row1(const char *str, uint8_t x = 0) {
        str_at(str, x, 1);
    }
    
    void str(const char *str) {
        str_at(str);
    }
    
    void on() {
        instruction(0x0C); // 0000 1DCB Display=1 Cursor=0 Blink=0
    
    }
    
    void off() {
        instruction(0x08); // 0000 1DCB Display=0 Cursor=0 Blink=0
    }
    
    void cgram(uint8_t a) {
        instruction(0x40 | a);
    }
    
    void ddram(uint8_t a) {
        instruction(0x80 | a);
    }
 
};
/*
   Crystalfontz CFAH1602BTMIJT 16x2 LCD display.
   http://www.coolcomponents.co.uk/catalog/blue-16x2-display-p-151.html (also part of mbed starter kit).
 
   Sitronix ST7066U functions (compatible with Hitachi HD44780).
   CFAH1602BTMIJT_v1.0.pdf
   http://www.crystalfontz.com/controllers/ST7066U.pdf
   
   LCD initialisation takes 40ms.
 
   Instruction              RS RW  7 6 5 4 3 2 1 0  Time (270kHz)
   Clear Display             0  0  0 0 0 0 0 0 0 1  1.52 ms Clear, Home, Entry Mode = Increment.
   Return Home               0  0  0 0 0 0 0 0 1 x  1.52 ms.
   Entry Mode Set            0  0  0 0 0 0 0 1 I S   .037ms Increment cursor, Shift display (shift cursor).
   Display On/Off            0  0  0 0 0 0 1 D C P   .037ms Display on, Cursor on, Position on.
   Cursor or Display Shift   0  0  0 0 0 1 D R x x   .037ms Display shift (cursor shift), Right (left).
   Function Set              0  0  0 0 1 D N F x x   .037ms Data interface 8 (4) bits, Number of lines 2 (1), Font 5x11 if 1 line (5x8).
   Set CGRAM address         0  0  0 1 A A A A A A   .037ms Set 6 bit CGRAM address in address counter.
   Set DDRAM address         0  0  1 A A A A A A A   .037ms Set 7 bit DDRAM address in address counter.
   Read Busy Flag and addr   0  1  F A A A A A A A   .000ms Read Busy Flag and address counter.
   Write data to RAM         1  0  A A A A A A A A   .037ms Write data to RAM (DDRAM or CGRAM).  Must do Set address first.
   Read data from RAM        1  1  A A A A A A A A   .037ms Read data from internal RAM (DDRAM or CGRAM).  Must do Set address first.
*/