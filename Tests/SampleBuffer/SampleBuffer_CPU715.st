PROGRAM SampleBuffer


CurrentCycleTime := __SYSVA_TCYCYCTIME;

testBufferGenerator.StartGenerator := StartSampleBufferTest;
testBufferGenerator.CntGenerator := CntSampleBufferTest;
testBufferGenerator.PulseTimeGenerator := PulseTimeSampleBufferTest;
testBufferGenerator.resCycleTime := __SYSVA_TCYCYCTIME;
testBufferGenerator(.StartGenerator, .CntGenerator, .PulseTimeGenerator, .resCycleTime);

SampleBuffer_BOOL := testBufferGenerator.varOut_BOOL;
SampleBuffer_BYTE := testBufferGenerator.varOut_BYTE;
SampleBuffer_DATE := testBufferGenerator.varOut_DATE;
SampleBuffer_DINT := testBufferGenerator.varOut_DINT;
SampleBuffer_DWORD := testBufferGenerator.varOut_DWORD;
SampleBuffer_INT := testBufferGenerator.varOut_INT;
SampleBuffer_LINT := testBufferGenerator.varOut_LINT;
SampleBuffer_LREAL := testBufferGenerator.varOut_LREAL;
SampleBuffer_LWORD := testBufferGenerator.varOut_LWORD;
SampleBuffer_REAL := testBufferGenerator.varOut_REAL;
SampleBuffer_SINT := testBufferGenerator.varOut_SINT;
SampleBuffer_STRING := testBufferGenerator.varOut_STRING;
SampleBuffer_TIME := testBufferGenerator.varOut_TIME;
SampleBuffer_UDINT := testBufferGenerator.varOut_UDINT;
SampleBuffer_UINT := testBufferGenerator.varOut_UINT;
SampleBuffer_ULINT := testBufferGenerator.varOut_ULINT;
SampleBuffer_USINT := testBufferGenerator.varOut_USINT;
SampleBuffer_WORD := testBufferGenerator.varOut_WORD;

IF testBufferGenerator.FinalGenerating THEN
    StartSampleBufferTest := FALSE;
    CntSampleBufferTest := 0;
    PulseTimeSampleBufferTest := T#0ms;
END_IF;


END_PROGRAM