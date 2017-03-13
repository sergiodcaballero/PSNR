

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('NetEmail.inc'),ONCE

                     MAP
                       INCLUDE('GESTION045.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
SendEmail PROCEDURE (string pEmailServer, string pEmailPort, string pEmailFrom, string pEmailTo, string pEmailSubject, string pEmailCC, string pEmailBcc, string pEmailFileList, string pEmailMessageText)

FilesOpened          BYTE                                  ! 
EmailServer          STRING(255)                           ! 
EmailPort            LONG                                  ! 
EmailFrom            STRING(255)                           ! 
EmailTo              STRING(1024)                          ! 
EmailSubject         STRING(252)                           ! 
EmailCC              STRING(1024)                          ! 
EmailBCC             STRING(1024)                          ! 
EmailFileList        STRING(8192)                          ! 
EmailMessageText     STRING(16384)                         ! 
Email_Spacer         USHORT                                ! 
EmailUser            STRING(255)                           ! 
EmailPassword        STRING(255)                           ! 
EmailHelo            STRING(255)                           ! 
EmailSSL             LONG                                  ! 
EmailStartTLS        LONG                                  ! 
EmailEmbedList       STRING(8192)                          ! 
EmailMessageHTML     STRING(16384)                         ! 
EmailCaRoot          STRING(255)                           ! 
window               WINDOW('Sending Email'),AT(,,68,30),FONT('MS Sans Serif',8,,FONT:regular),DOUBLE,AUTO,GRAY, |
  IMM,SYSTEM
                       BUTTON('&Send'),AT(9,8,50,15),USE(?EmailSend),LEFT,TIP('Send Email Now')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
!Local Data Classes
ThisSendEmail        CLASS(NetEmailSend)                   ! Generated by NetTalk Extension (Class Definition)
ErrorTrap              PROCEDURE(string errorStr,string functionName),DERIVED
MessageSent            PROCEDURE(),DERIVED

                     END


  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('SendEmail')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?EmailSend
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.Open(window)                                        ! Open window
  window{prop:hide} = 1
  post(event:accepted,?EmailSend)
                                               ! Generated by NetTalk Extension (Start)
  ThisSendEmail.SuppressErrorMsg = 1         ! No Object Generated Error Messages ! Generated by NetTalk Extension
  ThisSendEmail.init()
  if ThisSendEmail.error <> 0
    ! Put code in here to handle if the object does not initialise properly
  end
  ! Generated by NetTalk Extension
  ThisSendEmail.OptionsMimeTextTransferEncoding = '7bit'           ! '7bit', '8bit' or 'quoted-printable'
  ThisSendEmail.OptionsMimeHtmlTransferEncoding = 'quoted-printable'           ! '7bit', '8bit' or 'quoted-printable'
  Do DefineListboxStyle
  INIMgr.Fetch('SendEmail',window)                         ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ThisSendEmail.Kill()                      ! Generated by NetTalk Extension
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.Opened
    INIMgr.Update('SendEmail',window)                      ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.SetAlerts PROCEDURE

  CODE
  
  !!! Evolution Consulting FREE Templates Start!!!
     ALERT(EnterKey)
  
  !!! Evolution Consulting FREE Templates End!!!
  PARENT.SetAlerts


ThisWindow.TakeAccepted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receive all EVENT:Accepted's
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?EmailSend
      ThisWindow.Update()
      EmailServer      = pEmailServer
      EmailPort        = pEmailPort
      EmailTo          = pEmailTo
      EmailFrom        = pEmailFrom
      EmailCC          = pEmailCC
      EmailBCC         = pEmailBCC
      EmailSubject     = pEmailSubject
      EmailFileList    = pEmailFileList
      EmailMessageText = pEmailMessageText
      ThisSendEmail.AuthUser = clip (USUARIO_SMTP)          ! New 31/12/2001
      ThisSendEmail.AuthPassword = clip (PASSWORD_SMTP)  ! New 31/12/2001
      !ThisSendEmail.SecureEmail = 0 !SMTP_SEGURO
      
      ! Generated by NetTalk Extension
      ThisSendEmail.Server = EmailServer
      ThisSendEmail.Port = EmailPort
      ThisSendEmail.AuthUser = EmailUser
      ThisSendEmail.AuthPassword = EmailPassword
      ThisSendEmail.SSL = EmailSSL
      ThisSendEmail.SecureEmailStartTLS = EmailStartTLS
      If ThisSendEmail.SSL or ThisSendEmail.SecureEmailStartTLS
        ThisSendEmail.SSLCertificateOptions.CertificateFile = ''
        ThisSendEmail.SSLCertificateOptions.PrivateKeyFile = ''
        ThisSendEmail.SSLCertificateOptions.DontVerifyRemoteCertificateWithCARoot = 1
        ThisSendEmail.SSLCertificateOptions.DontVerifyRemoteCertificateCommonName = 1
        ThisSendEmail.SSLCertificateOptions.CARootFile = EmailCARoot
      End
      If ThisSendEmail.SecureEmailStartTLS
        ThisSendEmail.SSLCertificateOptions.DontVerifyRemoteCertificateCommonName = 1 ! Fudge this for now, as the certificate is not known when NetSimple does the CommonName check
      End
      ThisSendEmail.From = EmailFrom
      ThisSendEmail.ToList = EmailTo
      ThisSendEmail.ccList = EmailCC
      ThisSendEmail.bccList = EmailBCC
      ThisSendEmail.Subject = EmailSubject
      ThisSendEmail.AttachmentList = EmailFileList
      ThisSendEmail.EmbedList = EmailEmbedList
      ThisSendEmail.SetRequiredMessageSize (0, len(clip(EmailMessageText)), 0) ! You must call this function before populating self.MessageText  #ELSIF ( <> '')
      if ThisSendEmail.Error = 0
        ThisSendEmail.MessageText = EmailMessageText
        display()
        ThisSendEmail.SendMail(NET:EMailMadeFromPartsMode)
        display()
      end
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    ThisSendEmail.TakeEvent()                 ! Generated by NetTalk Extension
  ReturnValue = PARENT.TakeEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeWindowEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all window specific events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    CASE EVENT()
    OF EVENT:AlertKey
      
      !!! Evolution Consulting FREE Templates Start!!!
       CASE KEYCODE()
         OF EnterKey
            CASE FOCUS(){Prop:Type}
              OF CREATE:Button
                 POST(EVENT:ACCEPTED,FOCUS())
              OF CREATE:text  
                 PRESSKEY(ShiftEnter)
              ELSE
                 IF FOCUS()<> ThisWindow.OkControl
                    PRESSKEY(TabKey)
                    RETURN(Level:Notify)
                 ELSE
                    POST(Event:Accepted,Self.OkControl)
                 END!IF
            END!CASE
       END!CASE
      
      !!! Evolution Consulting FREE Templates End!!!
    OF EVENT:CloseWindow
      ! Generated by NetTalk Extension
      if records (ThisSendEmail.DataQueue) > 0
        if Message ('The email is still being sent.|Are you sure you want to quit?','Email Sending',ICON:Question,BUTTON:Yes+BUTTON:No,BUTTON:No) = Button:No
          cycle
        end
      end
      ! Generated by NetTalk Extension
    END
  ReturnValue = PARENT.TakeWindowEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisSendEmail.ErrorTrap PROCEDURE(string errorStr,string functionName)


  CODE
  ! Only display the error message once
  if global:firsttime = 1
    global:firsttime = 0
    self.SuppressErrorMsg = 0
  else
    self.SuppressErrorMsg = 1
  end
  PARENT.ErrorTrap(errorStr,functionName)
  post(event:closewindow)


ThisSendEmail.MessageSent PROCEDURE


  CODE
  PARENT.MessageSent
  post(event:closewindow)
