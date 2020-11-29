FILENAME REFFILE '/folders/myfolders/sasuser.v94/airline_delay.xlsx';

PROC IMPORT DATAFILE=REFFILE
    DBMS=XLSX
    OUT=WORK.IMPORT1;
    GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.IMPORT1; RUN;


proc means data=WORK.IMPORT1 chartype mean std min max n vardef=df;
    var _arr_delay _carrier_delay weather_delay nas_delay security_delay
        late_aircraft_delay;
    class year;
    
proc means data=WORK.IMPORT1 chartype mean std min max n vardef=df;
    var _arr_delay _carrier_delay weather_delay nas_delay security_delay
        late_aircraft_delay;
    class carrier;

proc means data=WORK.IMPORT1 chartype mean std min max n vardef=df;
    var arr_flights arr_del15 arr_cancelled arr_diverted _arr_delay;
    class year;

proc means data=WORK.IMPORT1 chartype mean std min max n sum vardef=df;
    var arr_flights arr_del15 arr_cancelled arr_diverted;
    class year;
Run;
