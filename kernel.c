void WriteString( int colour, const char *string )
{
    char *video = (char*) 0xB8000;
    while( *string != 0 )
    {
        *video++ = *string++;
        *video++ = colour;
    }
}
 
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
 
void start() 
{
 ClearScreen();
 char str[] = "Hello World!";
 WriteString(7, str);
}
