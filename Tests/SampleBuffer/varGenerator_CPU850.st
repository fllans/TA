FUNCTION_BLOCK varGenerator_CPU850


IF CntGenerator = currentCntGenerator OR NOT StartGenerator THEN
    varOut_BOOL := FALSE;
    varOut_BYTE := 0;
    varOut_DINT := 0;
    varOut_DWORD := 0;
    varOut_INT := 0;
    varOut_LINT := 0;
    varOut_LREAL := 0;
    varOut_LWORD := 0;
    varOut_REAL := 0;
    varOut_SINT := 0;
    varOut_TIME := T#0ms;
    varOut_UDINT := 0;
    varOut_UINT := 0;
    varOut_ULINT := 0;
    varOut_USINT := 0;
    varOut_WORD := 0;
            
    StartGenerator := FALSE;
    currentCntGenerator := 0;
    FinalGenerating := FALSE;    
END_IF;

IF StartGenerator THEN
    currentTimeGenerator := currentTimeGenerator + resCycleTime;

    IF currentTimeGenerator >= PulseTimeGenerator THEN
        varOut_BOOL := NOT varOut_BOOL;
        varOut_LINT := varOut_LINT + 1;
        varOut_TIME := varOut_TIME + PulseTimeGenerator;
        
        varOut_BYTE := ANY_TO_BYTE(varOut_LINT);
        varOut_DINT := ANY_TO_DINT(varOut_LINT);
        varOut_DWORD := ANY_TO_DWORD(varOut_LINT);
        varOut_INT := ANY_TO_INT(varOut_LINT);
        varOut_LREAL := ANY_TO_LREAL(varOut_LINT) / 100;
        varOut_LWORD := ANY_TO_LWORD(varOut_LINT);
        varOut_REAL := ANY_TO_REAL(varOut_LINT) / 10;
        varOut_SINT := ANY_TO_SINT(varOut_LINT);
        varOut_UDINT := ANY_TO_UDINT(varOut_LINT);
        varOut_UINT := ANY_TO_UINT(varOut_LINT);
        varOut_ULINT := ANY_TO_ULINT(varOut_LINT);
        varOut_USINT := ANY_TO_USINT(varOut_LINT);
        varOut_WORD := ANY_TO_WORD(varOut_LINT);

        currentTimeGenerator := T#0ms;
        currentCntGenerator := currentCntGenerator + 1;

        IF CntGenerator = currentCntGenerator THEN
            FinalGenerating := TRUE;
        END_IF;
    END_IF;
END_IF;


END_FUNCTION_BLOCK