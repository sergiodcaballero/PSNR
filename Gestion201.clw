

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPRHTML.INC'),ONCE
   INCLUDE('ABPRPDF.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('abprtext.inc'),ONCE
   INCLUDE('abprxml.inc'),ONCE
   INCLUDE('abrppsel.inc'),ONCE

                     MAP
                       INCLUDE('GESTION201.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
IMPRIMIR_CAJA_CUOTAS PROCEDURE 

Progress:Thermometer BYTE                                  ! 
L:NroReg             LONG                                  ! 
LOC:TOTAL            REAL                                  ! 
Process:View         VIEW(CAJA)
                       PROJECT(CAJ:DEBE)
                       PROJECT(CAJ:FECHA)
                       PROJECT(CAJ:HABER)
                       PROJECT(CAJ:MONTO)
                       PROJECT(CAJ:OBSERVACION)
                       PROJECT(CAJ:IDSUBCUENTA)
                       JOIN(SUB:INTEG_113,CAJ:IDSUBCUENTA)
                         PROJECT(SUB:DESCRIPCION)
                         PROJECT(SUB:IDCUENTA)
                         JOIN(CUE:PK_CUENTAS,SUB:IDCUENTA)
                           PROJECT(CUE:DESCRIPCION)
                           PROJECT(CUE:IDCUENTA)
                         END
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(490,2188,7469,7500),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',8,,FONT:regular,CHARSET:ANSI), |
  THOUS
                       HEADER,AT(479,1000,7479,1177),USE(?Header)
                         STRING('REPORTE DE CAJA '),AT(2771,146),USE(?String1),FONT(,14,,FONT:bold+FONT:underline), |
  TRN
                         STRING('FONDO'),AT(6979,938),USE(?String23),TRN
                         STRING('FECHA'),AT(4490,948),USE(?String25),TRN
                         STRING('FECHA DESDE: '),AT(1719,563),USE(?String2),TRN
                         STRING(@D6),AT(2813,563),USE(FECHA_DESDE),RIGHT(1)
                         STRING(@D6),AT(5156,563),USE(FECHA_HASTA),RIGHT(1)
                         LINE,AT(10,885,7458,0),USE(?Line1),COLOR(COLOR:Black)
                         STRING('NC'),AT(104,927),USE(?String24),TRN
                         STRING('HABER'),AT(6083,938),USE(?String20),TRN
                         STRING('SUBCUENTA'),AT(698,927),USE(?String17),TRN
                         STRING('OBS.'),AT(2792,938),USE(?String18),TRN
                         STRING('DEBE'),AT(5365,938),USE(?String19),TRN
                         LINE,AT(21,1146,7448,0),USE(?Line2),COLOR(COLOR:Black)
                         STRING('FECHA HASTA:'),AT(4042,563),USE(?String3),TRN
                       END
Detail                 DETAIL,AT(,,,292),USE(?Detail)
                         STRING(@s20),AT(396,31),USE(CUE:DESCRIPCION)
                         STRING(@n-13.2),AT(5885,31),USE(CAJ:HABER)
                         STRING(@n$-13.2),AT(6677,31),USE(CAJ:MONTO)
                         STRING(@d17),AT(4438,42),USE(CAJ:FECHA)
                         STRING(@s50),AT(1729,31,2552,177),USE(CAJ:OBSERVACION)
                         LINE,AT(5865,0,0,250),USE(?Line5),COLOR(COLOR:Black)
                         LINE,AT(5125,0,0,250),USE(?Line6),COLOR(COLOR:Black)
                         LINE,AT(354,10,0,250),USE(?Line8),COLOR(COLOR:Black)
                         LINE,AT(4344,0,0,250),USE(?Line11),COLOR(COLOR:Black)
                         LINE,AT(6635,0,0,250),USE(?Line10),COLOR(COLOR:Black)
                         STRING(@n-3),AT(21,31),USE(CUE:IDCUENTA),RIGHT(1)
                         LINE,AT(1708,0,0,250),USE(?Line7),COLOR(COLOR:Black)
                         STRING(@n-13.2),AT(5125,31,719,177),USE(CAJ:DEBE)
                         LINE,AT(10,250,7448,0),USE(?Line9),COLOR(COLOR:Black)
                       END
                       FOOTER,AT(490,9708,7490,969),USE(?Footer)
                         STRING('Monto Total de Caja entre el periodo de fecha seleccionado:'),AT(1510,21),USE(?String13), |
  FONT(,10),TRN
                         STRING(@n10.2),AT(5188,21),USE(LOC:TOTAL),FONT(,10),TRN
                         LINE,AT(10,302,7469,0),USE(?Line3),COLOR(COLOR:Black)
                         LINE,AT(21,396,7458,0),USE(?Line3:2),COLOR(COLOR:Black)
                         STRING('Fecha del Reporte:'),AT(31,479),USE(?EcFechaReport),FONT('Courier New',7),TRN
                         STRING('DatoEmpresa'),AT(2135,479),USE(?DatoEmpresa),FONT('Courier New',7),TRN
                         STRING('Evolution_Paginas_'),AT(5635,479),USE(?PaginaNdeX),FONT('Courier New',7),TRN
                       END
                       FORM,AT(510,1000,7469,9688),USE(?Form)
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
SetStaticControlsAttributes PROCEDURE(),DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepRealClass                         ! Progress Manager
Previewer            CLASS(PrintPreviewClass)              ! Print Previewer
Ask                    PROCEDURE(),DERIVED
Open                   PROCEDURE(),DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

TargetSelector       ReportTargetSelectorClass             ! Report Target Selector
XMLReporter          CLASS(XMLReportGenerator)             ! XML
Setup                  PROCEDURE(),DERIVED
                     END

HTMLReporter         CLASS(HTMLReportGenerator)            ! HTML
SetUp                  PROCEDURE(),DERIVED
                     END

TXTReporter          CLASS(TextReportGenerator)            ! TXT
Setup                  PROCEDURE(),DERIVED
                     END

PDFReporter          CLASS(PDFReportGenerator)             ! PDF
SetUp                  PROCEDURE(),DERIVED
                     END

!Comienzo Codigo CW Templates
!------------------------------------------------------------------------------------------------------------
?Exportarword  EQUATE(-1025)

QHList QUEUE,PRE(QHL)
Id                         SHORT
Nombre                     STRING(100)
Longitud                   SHORT
Pict                       STRING(50)
TextColor             SHORT
TextBack             SHORT
TextFont               STRING(20)
TextFontSize      SHORT
FTextColor             SHORT
FTextBack             SHORT
FTextFont               STRING(20)
FTextFontSize      SHORT
                         END
Titulo                     STRING(100)
QPAR QUEUE,PRE(Q)
FieldPar                 CSTRING(200)
                         END
evo::any     ANY
evo::envio   CSTRING(5000)
evo::path    CSTRING(5000)

Evo::Group  GROUP,PRE()
Evo::Aplication STRING(100)
Evo::Procedure STRING(100)
Evo::Html   BYTE
Evo::xls   BYTE
Evo::doc  BYTE
Evo::Ascii BYTE
Evo::xml   BYTE
Evo:typexport STRING(10)
   END


EVO:QDatos               QUEUE,PRE(QDat)
Col1                       CSTRING(100)
Col2                       CSTRING(100)
Col3                       CSTRING(100)
Col4                       CSTRING(100)
Col5                       CSTRING(100)
Col6                       CSTRING(100)
Col7                       CSTRING(100)
Col8                       CSTRING(100)
Col9                       CSTRING(100)
Col10                      CSTRING(100)
Col11                      CSTRING(100)
Col12                      CSTRING(100)
Col13                      CSTRING(100)
Col14                      CSTRING(100)
Col15                      CSTRING(100)
Col16                      CSTRING(100)
Col17                      CSTRING(100)
Col18                      CSTRING(100)
Col19                      CSTRING(100)
Col20                      CSTRING(100)
Col21                      CSTRING(100)
Col22                      CSTRING(100)
Col23                      CSTRING(100)
Col24                      CSTRING(100)
Col25                      CSTRING(100)
Col26                      CSTRING(100)
Col27                      CSTRING(100)
Col28                      CSTRING(100)
Col29                      CSTRING(100)
Col30                      CSTRING(100)
Col31                      CSTRING(100)
Col32                      CSTRING(100)
Col33                      CSTRING(100)
Col34                      CSTRING(100)
Col35                      CSTRING(100)
Col36                      CSTRING(100)
Col37                      CSTRING(100)
Col38                      CSTRING(100)
Col39                      CSTRING(100)
Col40                      CSTRING(100)
Col41                      CSTRING(100)
Col42                      CSTRING(100)
Col43                      CSTRING(100)
Col44                      CSTRING(100)
Col45                      CSTRING(100)
Col46                      CSTRING(100)
Col47                      CSTRING(100)
Col48                      CSTRING(100)
Col49                      CSTRING(100)
Col50                      CSTRING(100)
 END
!Fin Codigo  CW Templates
!------------------------------------------------------------------------------------------------------------

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------
QCargaExport ROUTINE
!Comienzo Codigo CW Templates
!------------------------------------------------------------------------------------------------------------
             Evo::Any &= WHAT(EVO:QDatos,1)
             Evo::Any  = FECHA_DESDE
             Evo::Any &= WHAT(EVO:QDatos,2)
             Evo::Any  = FECHA_HASTA
             Evo::Any &= WHAT(EVO:QDatos,3)
             Evo::Any  = CUE:DESCRIPCION
             Evo::Any &= WHAT(EVO:QDatos,4)
             Evo::Any  = CAJ:HABER
             Evo::Any &= WHAT(EVO:QDatos,5)
             Evo::Any  = CAJ:MONTO
             Evo::Any &= WHAT(EVO:QDatos,6)
             Evo::Any  = CAJ:FECHA
             Evo::Any &= WHAT(EVO:QDatos,7)
             Evo::Any  = CAJ:OBSERVACION
             Evo::Any &= WHAT(EVO:QDatos,8)
             Evo::Any  = CUE:IDCUENTA
             Evo::Any &= WHAT(EVO:QDatos,9)
             Evo::Any  = CAJ:DEBE
             Evo::Any &= WHAT(EVO:QDatos,10)
             Evo::Any  = LOC:TOTAL
        ADD(EVO:QDatos)
        ASSERT (NOT ErrorCode())
!Fin Codigo  CW Templates
!------------------------------------------------------------------------------------------------------------
CargaParametros ROUTINE
        FREE(QHList)
           QHL:Id      = 1
           QHL:Nombre  = 'FECHA_DESDE'
           QHL:Longitud= 100
           QHL:Pict    = '@S20'
           QHL:TextColor  = 0
           QHL:TextBack   = 0
           QHL:TextFont   = '2'
           QHL:TextFontSize   = 8
           QHL:FTextColor        = 0
           QHL:FTextBack         = 0
           QHL:FTextFont          ='2'
            QHL:FTextFontSize  =8
           ADD(QHList)
           QHL:Id      = 2
           QHL:Nombre  = 'FECHA_HASTA'
           QHL:Longitud= 100
           QHL:Pict    = '@S20'
           QHL:TextColor  = 0
           QHL:TextBack   = 0
           QHL:TextFont   = '2'
           QHL:TextFontSize   = 8
           QHL:FTextColor        = 0
           QHL:FTextBack         = 0
           QHL:FTextFont          ='2'
            QHL:FTextFontSize  =8
           ADD(QHList)
           QHL:Id      = 3
           QHL:Nombre  = 'DESCRIPCION'
           QHL:Longitud= 100
           QHL:Pict    = '@s50'
           QHL:TextColor  = 0
           QHL:TextBack   = 0
           QHL:TextFont   = '2'
           QHL:TextFontSize   = 8
           QHL:FTextColor        = 0
           QHL:FTextBack         = 0
           QHL:FTextFont          ='2'
            QHL:FTextFontSize  =8
           ADD(QHList)
           QHL:Id      = 4
           QHL:Nombre  = 'HABER'
           QHL:Longitud= 100
           QHL:Pict    = '@n-13.2'
           QHL:TextColor  = 0
           QHL:TextBack   = 0
           QHL:TextFont   = '2'
           QHL:TextFontSize   = 8
           QHL:FTextColor        = 0
           QHL:FTextBack         = 0
           QHL:FTextFont          ='2'
            QHL:FTextFontSize  =8
           ADD(QHList)
           QHL:Id      = 5
           QHL:Nombre  = 'MONTO'
           QHL:Longitud= 100
           QHL:Pict    = '@n-13.2'
           QHL:TextColor  = 0
           QHL:TextBack   = 0
           QHL:TextFont   = '2'
           QHL:TextFontSize   = 8
           QHL:FTextColor        = 0
           QHL:FTextBack         = 0
           QHL:FTextFont          ='2'
            QHL:FTextFontSize  =8
           ADD(QHList)
           QHL:Id      = 6
           QHL:Nombre  = 'FECHA'
           QHL:Longitud= 100
           QHL:Pict    = '@d17'
           QHL:TextColor  = 0
           QHL:TextBack   = 0
           QHL:TextFont   = '2'
           QHL:TextFontSize   = 8
           QHL:FTextColor        = 0
           QHL:FTextBack         = 0
           QHL:FTextFont          ='2'
            QHL:FTextFontSize  =8
           ADD(QHList)
           QHL:Id      = 7
           QHL:Nombre  = 'OBSERVACION'
           QHL:Longitud= 100
           QHL:Pict    = '@s50'
           QHL:TextColor  = 0
           QHL:TextBack   = 0
           QHL:TextFont   = '2'
           QHL:TextFontSize   = 8
           QHL:FTextColor        = 0
           QHL:FTextBack         = 0
           QHL:FTextFont          ='2'
            QHL:FTextFontSize  =8
           ADD(QHList)
           QHL:Id      = 8
           QHL:Nombre  = 'IDCUENTA'
           QHL:Longitud= 100
           QHL:Pict    = '@n-14'
           QHL:TextColor  = 0
           QHL:TextBack   = 0
           QHL:TextFont   = '2'
           QHL:TextFontSize   = 8
           QHL:FTextColor        = 0
           QHL:FTextBack         = 0
           QHL:FTextFont          ='2'
            QHL:FTextFontSize  =8
           ADD(QHList)
           QHL:Id      = 9
           QHL:Nombre  = 'DEBE'
           QHL:Longitud= 100
           QHL:Pict    = '@n-13.2'
           QHL:TextColor  = 0
           QHL:TextBack   = 0
           QHL:TextFont   = '2'
           QHL:TextFontSize   = 8
           QHL:FTextColor        = 0
           QHL:FTextBack         = 0
           QHL:FTextFont          ='2'
            QHL:FTextFontSize  =8
           ADD(QHList)
           QHL:Id      = 10
           QHL:Nombre  = 'TOTAL'
           QHL:Longitud= 100
           QHL:Pict    = '@n10.2'
           QHL:TextColor  = 0
           QHL:TextBack   = 0
           QHL:TextFont   = '2'
           QHL:TextFontSize   = 8
           QHL:FTextColor        = 0
           QHL:FTextBack         = 0
           QHL:FTextFont          ='2'
            QHL:FTextFontSize  =8
           ADD(QHList)
        !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        FREE(QPar)
        Q:FieldPar  = '1,2,3,4,5,6,7,8,9,10,'
        ADD(QPar)!.1.
        Q:FieldPar  = ';'
        ADD(QPar)!.2.
        Q:FieldPar  = 'Spanish'
        ADD(QPar)!.3.
        Q:FieldPar  = ''
        ADD(QPar)!.4.
        Q:FieldPar  = true
        ADD(QPar)!.5.
        Q:FieldPar  = ''
        ADD(QPar)!.6.
        Q:FieldPar  = 10
        ADD(QPar)!.7.
        Q:FieldPar  = 'FREE'
        ADD(QPar)   !.8.
        Titulo = 'Reporte de Caja '
        Q:FieldPar  = 'REPORT'
        ADD(QPar)   !.9.
        Q:FieldPar  = 1 !Order
         ADD(QPar)   !.10
         Q:FieldPar  = 0
         ADD(QPar)   !.11
         Q:FieldPar  = '1'
         ADD(QPar)   !.12

         Q:FieldPar  = ''
         ADD(QPar)   !.13

         Q:FieldPar  = ''
         ADD(QPar)   !.14

         Q:FieldPar  = ''
         ADD(QPar)   !.15

         Q:FieldPar  = '16'
        ADD(QPar)   !.16

        Q:FieldPar  =  1
        ADD(QPar)   !.17.
        Q:FieldPar  =  2
        ADD(QPar)   !.18.
        Q:FieldPar  =  '2'
        ADD(QPar)   !.19.
        Q:FieldPar  =  12
        ADD(QPar)   !.20.
        Q:FieldPar  = 0 !Exporta a excel sin borrar
        ADD(QPar)     !.21
        Q:FieldPar  = 0         !Nro Pag. Desde Report (BExp)
        ADD(QPar)     !.22
        Q:FieldPar  = 0
        ADD(QPar)     !.23 Caracteres Encoding para xml
        Q:FieldPar  = 1
        ADD(QPar)      !24
        Q:FieldPar  = '13021968'
        ADD(QPar)     !.25
  !---------------------------------------------------------------------------------------------
!!Registration 
        Q:FieldPar  = ' ReportExport'
        ADD(QPar)   ! 26  
        Q:FieldPar  =  ' '
        ADD(QPar)   ! 27  
        Q:FieldPar  =  ' ' 
        ADD(QPar)   ! 28  
        Q:FieldPar  =  'REXPORT' 
        ADD(QPar)   ! 29 Gestion201.clw
        
        !.30 en adelante
      ! 30 en adelante

!!! Parametros Grupo
        Evo::Aplication          = 'Gestion'
        Evo::Procedure          = GlobalErrors.GetProcedureName()& 7
        Evo::Html   = 0
        Evo::xls   = 1
        Evo::doc   = 1
        Evo::xml   = 0
        Evo::Ascii   = 0
        Evo:typexport = 'All'


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('IMPRIMIR_CAJA_CUOTAS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:CAJA.Open                                         ! File CAJA used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('IMPRIMIR_CAJA_CUOTAS',ProgressWindow)      ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:CAJA, ?Progress:PctText, Progress:Thermometer, ProgressMgr, CAJ:FECHA)
  ThisReport.AddSortOrder(CAJ:IDX_CAJA_FECHA)
  ThisReport.AddRange(CAJ:FECHA,FECHA_DESDE,FECHA_HASTA)
  ThisReport.AppendOrder('CAJ:IDCAJA')
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:CAJA.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  SELF.SetAlerts()
  LOC:TOTAL = 0
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CAJA.Close
  END
  IF SELF.Opened
    INIMgr.Update('IMPRIMIR_CAJA_CUOTAS',ProgressWindow)   ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SYSTEM{PROP:PrintMode} = 3
  ReturnValue = PARENT.OpenReport()
  
  !!! Evolution Consulting FREE Templates Start!!!
   IF Not ReturnValue
       REPORT$?EcFechaReport{prop:text} = FORMAT(TODAY(),@d6)&' - '&FORMAT(CLOCK(),@t4)
          REPORT$?DatoEmpresa{prop:hide} = True
   END
  IF ReturnValue = Level:Benign
    SELF.Report{PROPPRINT:Extend}=True
  END
  RETURN ReturnValue


ThisWindow.SetStaticControlsAttributes PROCEDURE

  CODE
  PARENT.SetStaticControlsAttributes
  !XML STATIC
  SELF.Attribute.Set(?String1,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String1,RepGen:XML,TargetAttr:TagName,'String1')
  SELF.Attribute.Set(?String1,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagName,'String23')
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagName,'String25')
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String2,RepGen:XML,TargetAttr:TagName,'String2')
  SELF.Attribute.Set(?String2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FECHA_DESDE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FECHA_DESDE,RepGen:XML,TargetAttr:TagName,'FECHA_DESDE')
  SELF.Attribute.Set(?FECHA_DESDE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FECHA_HASTA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FECHA_HASTA,RepGen:XML,TargetAttr:TagName,'FECHA_HASTA')
  SELF.Attribute.Set(?FECHA_HASTA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String24,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String24,RepGen:XML,TargetAttr:TagName,'String24')
  SELF.Attribute.Set(?String24,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagName,'String20')
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String17,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String17,RepGen:XML,TargetAttr:TagName,'String17')
  SELF.Attribute.Set(?String17,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagName,'String18')
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagName,'String19')
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String3,RepGen:XML,TargetAttr:TagName,'String3')
  SELF.Attribute.Set(?String3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CUE:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CUE:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'CUE:DESCRIPCION')
  SELF.Attribute.Set(?CUE:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CAJ:HABER,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CAJ:HABER,RepGen:XML,TargetAttr:TagName,'CAJ:HABER')
  SELF.Attribute.Set(?CAJ:HABER,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CAJ:MONTO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CAJ:MONTO,RepGen:XML,TargetAttr:TagName,'CAJ:MONTO')
  SELF.Attribute.Set(?CAJ:MONTO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CAJ:FECHA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CAJ:FECHA,RepGen:XML,TargetAttr:TagName,'CAJ:FECHA')
  SELF.Attribute.Set(?CAJ:FECHA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CAJ:OBSERVACION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CAJ:OBSERVACION,RepGen:XML,TargetAttr:TagName,'CAJ:OBSERVACION')
  SELF.Attribute.Set(?CAJ:OBSERVACION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CUE:IDCUENTA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CUE:IDCUENTA,RepGen:XML,TargetAttr:TagName,'CUE:IDCUENTA')
  SELF.Attribute.Set(?CUE:IDCUENTA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CAJ:DEBE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CAJ:DEBE,RepGen:XML,TargetAttr:TagName,'CAJ:DEBE')
  SELF.Attribute.Set(?CAJ:DEBE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagName,'String13')
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LOC:TOTAL,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LOC:TOTAL,RepGen:XML,TargetAttr:TagName,'LOC:TOTAL')
  SELF.Attribute.Set(?LOC:TOTAL,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?EcFechaReport,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?EcFechaReport,RepGen:XML,TargetAttr:TagName,'EcFechaReport')
  SELF.Attribute.Set(?EcFechaReport,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?DatoEmpresa,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?DatoEmpresa,RepGen:XML,TargetAttr:TagName,'DatoEmpresa')
  SELF.Attribute.Set(?DatoEmpresa,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PaginaNdeX,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PaginaNdeX,RepGen:XML,TargetAttr:TagName,'PaginaNdeX')
  SELF.Attribute.Set(?PaginaNdeX,RepGen:XML,TargetAttr:TagValueFromText,True)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  LOC:TOTAL = loc:total + CAJ:DEBE - CAJ:HABER
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:Detail)
   Do QCargaExport
  RETURN ReturnValue


Previewer.Ask PROCEDURE

  CODE
  
  !!! Evolution Consulting FREE Templates Start!!!
    L:NroReg = Records(SELF.ImageQueue)
    EvoP_P(SELF.ImageQueue,L:NroReg)        
  
  !!! Evolution Consulting FREE Templates End!!!
  PARENT.Ask


Previewer.Open PROCEDURE

  CODE
  PARENT.Open
  !Comienzo Codigo CW Templates
  !------------------------------------------------------------------------------------------------------------
    CREATE(?Exportarword,CREATE:Item)
    ?Exportarword{PROP:Use} = LASTFIELD()+300
    ?Exportarword{PROP:Text} = 'Exportacion'
    UNHIDE(?Exportarword)
  !Fin Codigo  CW Templates
  !------------------------------------------------------------------------------------------------------------


Previewer.TakeEvent PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeEvent()
  CASE EVENT()
    OF EVENT:Accepted
      CASE FIELD()
        OF ?Exportarword
  !Comienzo Codigo CW Templates
  !------------------------------------------------------------------------------------------------------------
          Do CargaParametros
              evo::path  = PATH()
              EcRptExport(QHList,EVO:QDatos,QPar,0,Titulo,Evo::Group)
              SETPATH(evo::path)
      END!CASE
  END!CASE
  RETURN Level:Benign
  !Fin Codigo  CW Templates
  !------------------------------------------------------------------------------------------------------------
  RETURN ReturnValue


XMLReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetRootTag('Clarion_60_XML_Document')
  SELF.SetForceXMLHeader(True)
  SELF.SetSupportNameSpaces(False)
  SELF.SetUseCRLF(True)
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetPagesAsParentTag(False)


HTMLReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentName('Clarion Report')
  SELF.SetNavigationText('First','Last','Next','Prior','Select Page','Page_','Load Page')
  SELF.SetSubDirectory(1,'_Files','_Images')
  SELF.SetSingleFile(0)


TXTReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetMargin(0,0,0,0)
  SELF.SetCheckBoxString('[X]','[_]')
  SELF.SetRadioButtonString('(*)','(_)')
  SELF.SetLineString('|','|','-','-','/','\','\','/')
  SELF.SetTextFillString(' ',CHR(176),CHR(177),CHR(178),CHR(219))
  SELF.SetOmitGraph(False)


PDFReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentInfo('CW Report','Gestion','IMPRIMIR_CAJA_CUOTAS','IMPRIMIR_CAJA_CUOTAS','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

