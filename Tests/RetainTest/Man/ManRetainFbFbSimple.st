PROGRAM ManRetainFbFbSimple


// RETAINTEST_RETAIN_FBFBSIMPLE(.TRIGGER_IMP, .StartGenerate, .PULSE_TIME);
// RETAINTEST_NONRETAIN_FBFBSIMPLE(.TRIGGER_IMP, .StartGenerate, .PULSE_TIME);
// RETAINTEST_AUTO_FBFBSIMPLE(.TRIGGER_IMP, .StartGenerate, .PULSE_TIME);

RETAINTEST_RETAIN_FBFBSIMPLE.TRIGGER_IMP := TRIGGER_IMP.Q; 
RETAINTEST_RETAIN_FBFBSIMPLE.StartGenerate := StartManRetainTest;
RETAINTEST_RETAIN_FBFBSIMPLE.PULSE_TIME := PULSE_TIME;

RETAINTEST_NONRETAIN_FBFBSIMPLE.TRIGGER_IMP := TRIGGER_IMP.Q; 
RETAINTEST_NONRETAIN_FBFBSIMPLE.StartGenerate := StartManRetainTest;
RETAINTEST_NONRETAIN_FBFBSIMPLE.PULSE_TIME := PULSE_TIME;

RETAINTEST_AUTO_FBFBSIMPLE.TRIGGER_IMP := TRIGGER_IMP.Q; 
RETAINTEST_AUTO_FBFBSIMPLE.StartGenerate := StartManRetainTest;
RETAINTEST_AUTO_FBFBSIMPLE.PULSE_TIME := PULSE_TIME;


END_PROGRAM