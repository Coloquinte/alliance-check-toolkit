int segDec(int in){
		if(in&0xF==0x0) return  0x40 + 0x80;
	else if(in&0xF==0x1) return  0x79 + 0x80;
	else if(in&0xF==0x2) return  0x24 + 0x80;
	else if(in&0xF==0x3) return  0x30 + 0x80;
	else if(in&0xF==0x4) return  0x19 + 0x80;
	else if(in&0xF==0x5) return  0x12 + 0x80;
	else if(in&0xF==0x6) return  0x02 + 0x80;
	else if(in&0xF==0x7) return  0x58 + 0x80;
	else if(in&0xF==0x8) return  0x00 + 0x80;
	else if(in&0xF==0x9) return  0x18 + 0x80;
	else if(in&0xF==0xA) return  0x08 + 0x80;
	else if(in&0xF==0xB) return  0x03 + 0x80;
	else if(in&0xF==0xC) return  0x27 + 0x80;
	else if(in&0xF==0xD) return  0x21 + 0x80;
	else if(in&0xF==0xE) return  0x06 + 0x80;
	else if(in&0xF==0xF) return  0x0e + 0x80;
}

for(i=0;i<16;i++) z[i]=segDec(i);
halt;

while(1)
	mem[0xA008]=segDec(mem[0xA001]);

	
else
else
else
else
else
else
else
else
else
else
else
else
else
else
else
else