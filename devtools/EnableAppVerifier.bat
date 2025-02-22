@echo Created per the instructions at https://intranet.valvesoftware.com/wiki/index.php/AppVerifier_for_finding_memory_bugs_and_other_problems
@echo Enabling AppVerifier with reasonable settings for TF2
@echo This must be run with administrator privileges

@rem The settings are created using the App Verifier UI and can be exported to the .reg file
@rem with this command:
@rem REG EXPORT "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\hl2.exe" tf2AppVerifierSettings.reg /y

@rem Import the App Verifier settings
reg import %~dp0tf2AppVerifierSettings.reg
@rem Increase the size of the database of alloc/free stacks from 8 MB (too small) to 100 MB.
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\hl2.exe" /v StackTraceDatabaseSizeInMB /t REG_DWORD /d 100 /f
