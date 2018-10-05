%{

char year[2];
int yearInt = 0;
int subtract = 18;

%}
  
year1 [0-9]+
year2 [0-9][0-9]
county1 C|CE|CN|CW|D|DL|G|KE|KK|KY|L|LD|LH|LM|LS|MH|MN|MO|OY|RN|SO|T|W|WH|WX|WW
county2 C|CE|CN|CW|D|DL|G|KE|KK|KY|L|LK|LD|LH|LM|LS|MH|MN|MO|OY|RN|SO|TN|TS|W|WD|WH|WX|WW
digit ([0-9])|([0-9][0-9])|([0-9][0-9][0-9])|([0-9][0-9][0-9][0-9])|([0-9][0-9][0-9][0-9][0-9]|([0-9][0-9][0-9][0-9][0-9][0-9]))
errorCounty [a-zA-Z]*


%%
"1""3""1""-"{county2}"-"{digit}                {printf("5\n");}
"1""3""2""-"{county2}"-"{digit}                {printf("5\n");}
"1""4""1""-"{county1}"-"{digit}                {printf("4\n");}
"1""4""2""-"{county1}"-"{digit}                {printf("4\n");}
"1""5""1""-"{county1}"-"{digit}                {printf("3\n");}
"1""5""2""-"{county1}"-"{digit}                {printf("3\n");}
"1""6""1""-"{county1}"-"{digit}                {printf("2\n");}
"1""6""2""-"{county1}"-"{digit}                {printf("2\n");}
"1""7""1""-"{county1}"-"{digit}                {printf("1\n");}
"1""7""2""-"{county1}"-"{digit}                {printf("1\n");}
"1""8""1""-"{county1}"-"{digit}                {printf("0\n");}
"1""8""2""-"{county1}"-"{digit}                {printf("0\n");}
{year2}"-"{county2}"-"{digit}                  {strncpy(year, yytext, 2); yearInt = atoi(year); if(yearInt >18) subtract=subtract+100; int printInt = subtract-yearInt;if(subtract>18)subtract=subtract-100; printf("%d\n", printInt);}
{year1}"-"{errorCounty}"-"{year1}              {printf("INVALID\n");}
{year1}                                        {printf("INVALID\n");}
{errorCounty}                                  {printf("INVALID\n");}
[ \t]                                          {}
\n                                             {}
.                                              {}


%%

int main()
{
  yylex();
  return 0;
}
