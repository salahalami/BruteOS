#ifndef VGA_H
#define VGA_H

void ClearScreen(void);
void WriteString( const char *string, int colour );
void SetCursor(int row, int column);


void ClearScreen()
{
	char* video = (char*) 0xB8000;
	int i = 0;
	while(i < 80*25*2)
	{
		*video++ = 0;
		*video++ = 7;
		i++;
	}
}

void WriteString( const char *string, int colour )
{
    char *video = (char*) 0xB8000;
    while( *string != 0 )
    {
        *video++ = *string++;
        *video++ = colour;
    }
}

void SetCursor(int row, int column)
{
	unsigned short position = (row * 80) + column;
	outportb(0x3D4, 0x0F);
	outportb(0x3D5, (unsigned char)( position & 0xFF));
	outportb(0x3D4, 0x0E);
	outportb(0x3D5, (unsigned char )((position >> 8) & 0xFF));
}

#endif //VGA_H

