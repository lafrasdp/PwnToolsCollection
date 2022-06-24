add-type -assemblyname system.identitymodel
new-object system.identitymodel.tokens.kerberosrequestorsecuritytoken -Argumentlist 'SPN'
