*** Settings ***
Resource    Features/GlobalResources.robot

*** Variables ***
${emailOrNumberField}    //input[@id="ap_email"]
${continueButton}    //input[@id="continue"]
${passwordField}    //input[@id="ap_password"]
${signInButton}    //input[@id="signInSubmit"]
${addPhoneSkipLink}    //a[@id="ap-account-fixup-phone-skip-link"]