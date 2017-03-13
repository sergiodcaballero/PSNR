

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPRHTML.INC'),ONCE
   INCLUDE('ABPRPDF.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('abprtext.inc'),ONCE
   INCLUDE('abprxml.inc'),ONCE
   INCLUDE('abrppsel.inc'),ONCE

                     MAP
                       INCLUDE('GESTION021.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION002.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION013.INC'),ONCE        !Req'd for module callout resolution
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
        ADD(QPar)   ! 29 Gestion021.clw
        
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

!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
IMPRIMIR_CAJA PROCEDURE 

Window               WINDOW('LISTADO DE CAJA '),AT(,,256,83),FONT('MS Sans Serif',8,,FONT:regular),CENTER,GRAY
                       PROMPT('FECHA DESDE:'),AT(12,8),USE(?FECHA_DESDE:Prompt)
                       ENTRY(@D6),AT(67,8,60,10),USE(FECHA_DESDE),RIGHT(1)
                       PROMPT('FECHA HASTA:'),AT(134,9),USE(?FECHA_HASTA:Prompt)
                       ENTRY(@D6),AT(190,9,60,10),USE(FECHA_HASTA),RIGHT(1)
                       BUTTON('&Imprimir Caja'),AT(99,30,71,18),USE(?OkButton),LEFT,ICON(ICON:Print1),DEFAULT,FLAT
                       BUTTON('&SALIR'),AT(103,60,58,22),USE(?CancelButton),LEFT,ICON('SALIR.ICO'),FLAT
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass

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
  GlobalErrors.SetProcedureName('IMPRIMIR_CAJA')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?FECHA_DESDE:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('IMPRIMIR_CAJA',Window)                     ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.Opened
    INIMgr.Update('IMPRIMIR_CAJA',Window)                  ! Save window data to non-volatile store
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
    CASE ACCEPTED()
    OF ?CancelButton
       POST(EVENT:CloseWindow)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?OkButton
      ThisWindow.Update()
      START(IMPRIMIR_CAJA_CUOTAS, 25000)
      ThisWindow.Reset
    END
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
    END
  ReturnValue = PARENT.TakeWindowEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
Exportar_Web PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(SOCIOS)
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepStringClass                       ! Progress Manager

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
  GlobalErrors.SetProcedureName('Exportar_Web')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:CONSULTORIO.Open                                  ! File CONSULTORIO used by this procedure, so make sure it's RelationManager is open
  Relate:CONSULTRIO_ADHERENTE.Open                         ! File CONSULTRIO_ADHERENTE used by this procedure, so make sure it's RelationManager is open
  Relate:LOCALIDAD.Open                                    ! File LOCALIDAD used by this procedure, so make sure it's RelationManager is open
  Relate:PADRON_WEB.Open                                   ! File PADRON_WEB used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('Exportar_Web',ProgressWindow)              ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisProcess.Init(Process:View, Relate:SOCIOS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, SOC:NOMBRE)
  ThisProcess.AddSortOrder(SOC:IDX_SOCIOS_NOMBRE)
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(SOCIOS,'QUICKSCAN=on')
  SELF.SetAlerts()
      pad2:MATRICULA          =  'MATRICULA'
      pad2:NOMBRE             =  'NOMBRE'
      PAD2:TELEFONO_LABORAL    =  'TELEFONO'
      PAD2:DIRECCION_LABORAL   =  'DIRECCION'
      !!! BUSCO LOCALIDAD
      LOC:IDLOCALIDAD  = SOC:IDLOCALIDAD
      ACCESS:LOCALIDAD.TRYFETCH(LOC:PK_LOCALIDAD)
      PAD2:COD_TEL    =   'COD. TELEF'
      PAD2:LOCALIDAD  =   'LOCALIDAD'
      ACCESS:PADRON_WEB.INSERT()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CONSULTORIO.Close
    Relate:CONSULTRIO_ADHERENTE.Close
    Relate:LOCALIDAD.Close
    Relate:PADRON_WEB.Close
    Relate:SOCIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('Exportar_Web',ProgressWindow)           ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  IF SOC:CANTIDAD <= GLO:CANTIDAD_CUOTAS AND SOC:BAJA = 'NO' AND SOC:BAJA_TEMPORARIA = 'NO' THEN
      pad2:MATRICULA          =  SOC:MATRICULA
      pad2:NOMBRE             =  SOC:NOMBRE
       !!!!!
      PAD2:TELEFONO_LABORAL    = ''
      PAD2:DIRECCION_LABORAL   = ''
      PAD2:COD_TEL    = '' 
      PAD2:LOCALIDAD  = ''
      CON2:IDSOCIO = SOC:IDSOCIO
      set(CON2:FK_CONSULTORIO_SOCIOS,CON2:FK_CONSULTORIO_SOCIOS)
      LOOP
          if access:CONSULTORIO.next() then break.
          if CON2:IDSOCIO <> SOC:IDSOCIO then break.
          if CON2:ACTIVO = 'SI' then 
              PAD2:TELEFONO_LABORAL    =  CON2:TELEFONO
              PAD2:DIRECCION_LABORAL   =  CON2:DIRECCION
              !!! BUSCO LOCALIDAD
              LOC:IDLOCALIDAD  = CON2:IDLOCALIDAD
              ACCESS:LOCALIDAD.TRYFETCH(LOC:PK_LOCALIDAD)
              PAD2:COD_TEL    =   LOC:COD_TELEFONICO
              PAD2:LOCALIDAD  =   LOC:DESCRIPCION
              ACCESS:PADRON_WEB.INSERT()
         end      
      END
      !!! dirección adherente 
      CON1:IDSOCIO = SOC:IDSOCIO
      set(CON1:FK_CONSULTRIO_ADHERENTE_SOCIO,CON1:FK_CONSULTRIO_ADHERENTE_SOCIO)
      LOOP
          if access:CONSULTRIO_ADHERENTE.next() then break.
          if CON1:IDSOCIO <> SOC:IDSOCIO then break.
          !! busco consultorio 
          CON2:IDCONSULTORIO = CON1:IDCONSULTORIO
          access:CONSULTORIO.tryfetch(CON2:PK_CONSULTORIO)
          if CON2:ACTIVO = 'SI' then 
              PAD2:TELEFONO_LABORAL    =  CON2:TELEFONO
              PAD2:DIRECCION_LABORAL   =  CON2:DIRECCION
              !!! BUSCO LOCALIDAD
              LOC:IDLOCALIDAD  = CON2:IDLOCALIDAD
              ACCESS:LOCALIDAD.TRYFETCH(LOC:PK_LOCALIDAD)
              PAD2:COD_TEL    =   LOC:COD_TELEFONICO
              PAD2:LOCALIDAD  =   LOC:DESCRIPCION
              ACCESS:PADRON_WEB.INSERT()
          end     
      end
      !!! SI NO POSEE DATOS DE CONSULTORIO SE CARGA LOS DATOS LABORALES 
      if PAD2:LOCALIDAD  = '' then
          LOC:IDLOCALIDAD  = SOC:IDLOCALIDAD
          ACCESS:LOCALIDAD.TRYFETCH(LOC:PK_LOCALIDAD)
          PAD2:COD_TEL    =   LOC:COD_TELEFONICO
          PAD2:LOCALIDAD  =   LOC:DESCRIPCION
          PAD2:TELEFONO_LABORAL    = SOC:TELEFONO_LABORAL
          PAD2:DIRECCION_LABORAL   = SOC:DIRECCION_LABORAL
          ACCESS:PADRON_WEB.INSERT()
      END     
  END
  
  
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
Exportar_Web_FROM PROCEDURE 

Window               WINDOW('Exportar a la Web'),AT(,,164,96),FONT('MS Sans Serif',8,,FONT:regular),GRAY
                       BUTTON('&Padrón Habilitados'),AT(31,9,102,19),USE(?OkButton),LEFT,ICON(ICON:NextPage),FLAT
                       BUTTON('Padrón por OS'),AT(37,36,89,17),USE(?Button3),LEFT,ICON(ICON:Pick),FLAT
                       BUTTON('&Cancelar'),AT(54,72,57,14),USE(?CancelButton),LEFT,ICON(ICON:Cross),FLAT
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass

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
  GlobalErrors.SetProcedureName('Exportar_Web_FROM')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?OkButton
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('Exportar_Web_FROM',Window)                 ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.Opened
    INIMgr.Update('Exportar_Web_FROM',Window)              ! Save window data to non-volatile store
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
    CASE ACCEPTED()
    OF ?OkButton
      open(padron_web)
      empty(padron_web)
      if errorcode() then
          MESSAGE('ERROR AL BORRAR PADRON WEB')
          CYCLE
      ELSE
          CLOSE(PADRON_WEB)
      END
    OF ?Button3
      open(padron_web_OS)
      empty(padron_web_OS)
      if errorcode() then
          MESSAGE('ERROR AL BORRAR PADRON WEB OS')
          CYCLE
      ELSE
          CLOSE(PADRON_WEB_OS)
      END
    OF ?CancelButton
       POST(EVENT:CloseWindow)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?OkButton
      ThisWindow.Update()
      START(Exportar_Web, 25000)
      ThisWindow.Reset
    OF ?Button3
      ThisWindow.Update()
      Exportar_Web_2()
      ThisWindow.Reset
    END
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
    END
  ReturnValue = PARENT.TakeWindowEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
Exportar_Web_2 PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(SOCIOSXOS)
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager

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
  GlobalErrors.SetProcedureName('Exportar_Web_2')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:CONSULTORIO.Open                                  ! File CONSULTORIO used by this procedure, so make sure it's RelationManager is open
  Relate:CONSULTRIO_ADHERENTE.Open                         ! File CONSULTRIO_ADHERENTE used by this procedure, so make sure it's RelationManager is open
  Relate:LOCALIDAD.Open                                    ! File LOCALIDAD used by this procedure, so make sure it's RelationManager is open
  Relate:OBRA_SOCIAL.Open                                  ! File OBRA_SOCIAL used by this procedure, so make sure it's RelationManager is open
  Relate:PADRON_WEB_OS.Open                                ! File PADRON_WEB_OS used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOSXOS.Open                                    ! File SOCIOSXOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('Exportar_Web_2',ProgressWindow)            ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisProcess.Init(Process:View, Relate:SOCIOSXOS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, SOC3:IDOS)
  ThisProcess.AddSortOrder(SOC3:FK_SOCIOSXOS_OS)
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(SOCIOSXOS,'QUICKSCAN=on')
  SELF.SetAlerts()
      PAD21:OBRA_SOCIAL  = 'OBRA SOCIAL'
      PAD21:MATRICULA           =  'MATRICULA'
      PAD21:NOMBRE              =  'NOMBRE'
      PAD21:TELEFONO_LABORAL    =  'TELEFONO'
      PAD21:DIRECCION_LABORAL   =  'DIRECCION'
      !!! BUSCO LOCALIDAD
      LOC:IDLOCALIDAD  = SOC:IDLOCALIDAD
      ACCESS:LOCALIDAD.TRYFETCH(LOC:PK_LOCALIDAD)
      PAD21:COD_TEL    =   'COD. TELEF'
      PAD21:LOCALIDAD  =   'LOCALIDAD'
      ACCESS:PADRON_WEB_os.INSERT()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CONSULTORIO.Close
    Relate:CONSULTRIO_ADHERENTE.Close
    Relate:LOCALIDAD.Close
    Relate:OBRA_SOCIAL.Close
    Relate:PADRON_WEB_OS.Close
    Relate:SOCIOS.Close
    Relate:SOCIOSXOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('Exportar_Web_2',ProgressWindow)         ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  OBR:IDOS = SOC3:IDOS
  ACCESS:OBRA_SOCIAL.TRYFETCH(OBR:PK_OBRA_SOCIAL)
  PAD21:OBRA_SOCIAL = OBR:NOMPRE_CORTO
  !!!SOLO CARGA LAS OS QUE ESTAN MARCADAS PARA LA WEB
  IF OBR:PRONTO_PAGO = 'SI' THEN 
  
      SOC:IDSOCIO = SOC3:IDSOCIOS
      access:socios.TRYFETCH(SOC:PK_SOCIOS)
      IF SOC:CANTIDAD <= GLO:CANTIDAD_CUOTAS AND SOC:BAJA = 'NO' AND SOC:BAJA_TEMPORARIA = 'NO' THEN
          PAD21:MATRICULA           =  SOC:MATRICULA
          PAD21:NOMBRE              =  SOC:NOMBRE
          !!!!!
          PAD21:TELEFONO_LABORAL    = ''
          PAD21:DIRECCION_LABORAL   = ''
          PAD21:COD_TEL    = '' 
          PAD21:LOCALIDAD  = ''
          CON2:IDSOCIO = SOC3:IDSOCIOS
          set(CON2:FK_CONSULTORIO_SOCIOS,CON2:FK_CONSULTORIO_SOCIOS)
          LOOP
              if access:CONSULTORIO.next() then break.
              if CON2:IDSOCIO <> SOC3:IDSOCIOS then break.
              if CON2:ACTIVO = 'SI' then 
                  PAD21:TELEFONO_LABORAL    =  CON2:TELEFONO
                  PAD21:DIRECCION_LABORAL   =  CON2:DIRECCION
                  !!! BUSCO LOCALIDAD
                  LOC:IDLOCALIDAD  = CON2:IDLOCALIDAD
                  ACCESS:LOCALIDAD.TRYFETCH(LOC:PK_LOCALIDAD)
                  PAD21:COD_TEL    =   LOC:COD_TELEFONICO
                  PAD21:LOCALIDAD  =   LOC:DESCRIPCION
                  ACCESS:PADRON_WEB_OS.INSERT()
              end     
          END
          !!! dirección adherente 
          CON1:IDSOCIO = SOC3:IDSOCIOS
          set(CON1:FK_CONSULTRIO_ADHERENTE_SOCIO,CON1:FK_CONSULTRIO_ADHERENTE_SOCIO)
          LOOP
              if access:CONSULTRIO_ADHERENTE.next() then break.
              if CON1:IDSOCIO <> SOC3:IDSOCIOS then break.
              !! busco consultorio 
              CON2:IDCONSULTORIO = CON1:IDCONSULTORIO
              access:CONSULTORIO.tryfetch(CON2:PK_CONSULTORIO)
              if CON2:ACTIVO = 'SI' then 
                  PAD21:TELEFONO_LABORAL    =  CON2:TELEFONO
                  PAD21:DIRECCION_LABORAL   =  CON2:DIRECCION
                  !!! BUSCO LOCALIDAD
                  LOC:IDLOCALIDAD  = CON2:IDLOCALIDAD
                  ACCESS:LOCALIDAD.TRYFETCH(LOC:PK_LOCALIDAD)
                  PAD21:COD_TEL    =   LOC:COD_TELEFONICO
                  PAD21:LOCALIDAD  =   LOC:DESCRIPCION
                  ACCESS:PADRON_WEB_OS.INSERT()
              end     
          end
          !!! SI NO POSEE DATOS DE CONSULTORIO SE CARGA LOS DATOS LABORALES 
          if PAD21:DIRECCION_LABORAL   = ''  then
              PAD21:TELEFONO_LABORAL    = SOC:TELEFONO_LABORAL
              PAD21:DIRECCION_LABORAL   = SOC:DIRECCION_LABORAL
              LOC:IDLOCALIDAD  = SOC:IDLOCALIDAD
              ACCESS:LOCALIDAD.TRYFETCH(LOC:PK_LOCALIDAD)
              PAD21:COD_TEL    =   LOC:COD_TELEFONICO
              PAD21:LOCALIDAD  =   LOC:DESCRIPCION
              ACCESS:PADRON_WEB_OS.INSERT()
          enD
      END
  END     
          
              
          
  
  
  
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Splash
!!! The About Window
!!! </summary>
AboutWindow PROCEDURE 

Window               WINDOW('Acerca de ...'),AT(,,235,118),FONT('MS Sans Serif',8,,FONT:regular),DOUBLE,TILED,CENTER, |
  GRAY,HLP('~AboutWindow'),PALETTE(256)
                       STRING('Copyright 2010'),AT(91,22,53,10),USE(?CopyrightDate),TRN
                       STRING('Produced by ASC Sergio Daniel Caballero'),AT(16,44,203,10),USE(?Developer),FONT('Arial', |
  11,COLOR:Black,FONT:bold,CHARSET:ANSI),TRN
                       STRING('sergiodcaballero@gmail.com'),AT(54,61,133,10),USE(?AboutHeading),FONT('Arial',10,COLOR:Black, |
  FONT:bold,CHARSET:ANSI),TRN
                       PANEL,AT(20,76,215,4),USE(?Panel:6),BEVEL(1,0,1536)
                       PROMPT('Cuidado:  este programa  es protegido por Derecho de Autor.  Prohibida si repro' & |
  'ducción o Distribución de este programa, o parte de el, su violación conlleva severa' & |
  's penalidades crimilaes y civiles.'),AT(8,91,163,21),USE(?PromptCopyright),FONT('Small Fonts', |
  6),TRN
                       BUTTON,AT(207,84,19,21),USE(?Close),LEFT,ICON('salir.ico'),FLAT
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass

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
  GlobalErrors.SetProcedureName('AboutWindow')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?CopyrightDate
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('AboutWindow',Window)                       ! Restore window settings from non-volatile store
  TARGET{Prop:Timer} = 0                                   ! Close window on timer event, so configure timer
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.Opened
    INIMgr.Update('AboutWindow',Window)                    ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
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
  ReturnValue = PARENT.TakeWindowEvent()
    CASE EVENT()
    OF EVENT:LoseFocus
        POST(Event:CloseWindow)                            ! Splash window will close when focus is lost
    OF Event:Timer
      POST(Event:CloseWindow)                              ! Splash window will close on event timer
    ELSE
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Report
!!! Recibo de Pago 
!!! </summary>
IMPRIMIR_PAGO_ANUAL PROCEDURE 

Progress:Thermometer BYTE                                  ! 
L:NroReg             LONG                                  ! 
LOC:LETRAS           STRING(100)                           ! 
Process:View         VIEW(INGRESOS_FACTURA)
                       PROJECT(ING2:FECHA)
                       PROJECT(ING2:IDINGRESO_FAC)
                       PROJECT(ING2:IDRECIBO)
                       PROJECT(ING2:MONTO)
                       PROJECT(ING2:OBSERVACION)
                       PROJECT(ING2:IDSOCIO)
                       JOIN(SOC:PK_SOCIOS,ING2:IDSOCIO)
                         PROJECT(SOC:CUIT)
                         PROJECT(SOC:DIRECCION)
                         PROJECT(SOC:NOMBRE)
                         PROJECT(SOC:TIPOIVA)
                         JOIN(TIP7:PK_TIPO_IVA,SOC:TIPOIVA)
                           PROJECT(TIP7:DECRIPCION)
                         END
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(16,5,182,278),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',9,COLOR:Black,FONT:bold,CHARSET:ANSI), |
  MM
detail                 DETAIL,AT(0,0,,279),USE(?unnamed:4),FONT('Arial',10,,FONT:regular,CHARSET:ANSI)
                         STRING('Fecha:'),AT(127,17),USE(?String22),FONT(,12),TRN
                         STRING(@d17),AT(141,17),USE(ING2:FECHA),FONT(,12),RIGHT(1)
                         STRING('Señor/es:'),AT(1,44),USE(?String14),TRN
                         STRING(@s30),AT(23,43,86,6),USE(SOC:NOMBRE)
                         STRING('Domicilio:'),AT(1,50),USE(?String16),TRN
                         STRING(@s100),AT(24,49,85,6),USE(SOC:DIRECCION)
                         TEXT,AT(14,69,162,34),USE(ING2:OBSERVACION),FONT('Arial',8,,FONT:regular,CHARSET:ANSI)
                         STRING(@n-10.2),AT(147,120),USE(ING2:MONTO),FONT(,12,,FONT:bold)
                         STRING('Fecha:'),AT(121,161),USE(?String37),FONT(,12),TRN
                         STRING(@d17),AT(137,161),USE(ING2:FECHA,,?ING2:FECHA:2),FONT(,12)
                         STRING('Señor/es:'),AT(1,182),USE(?String26),TRN
                         STRING(@s30),AT(20,182,71,6),USE(SOC:NOMBRE,,?SOC:NOMBRE:2)
                         STRING('Domicilio:'),AT(1,188),USE(?String27),TRN
                         STRING(@s100),AT(23,187,88,6),USE(SOC:DIRECCION,,?SOC:DIRECCION:2)
                         TEXT,AT(14,218,166,23),USE(ING2:OBSERVACION,,?ING2:OBSERVACION:2),FONT('Arial',8,,FONT:regular, |
  CHARSET:ANSI)
                         STRING('SON $:'),AT(119,255),USE(?String25),FONT(,12),TRN
                         STRING(@n-10.2),AT(135,255),USE(ING2:MONTO,,?ING2:MONTO:2),FONT(,12,,FONT:bold),LEFT(1)
                         STRING('Res. Carg. '),AT(1,269),USE(?String36),FONT(,8),TRN
                         STRING(@n-14),AT(15,269),USE(ING2:IDRECIBO),FONT(,8),TRN
                         STRING('SON $:'),AT(130,120),USE(?String19),FONT(,12),TRN
                         STRING('CUIT:'),AT(112,44),USE(?STRING1)
                         STRING('IVA:<0DH,0AH>'),AT(114,50,10,5),USE(?STRING2)
                         STRING(@s30),AT(125,50,57),USE(TIP7:DECRIPCION)
                         STRING(@P##-########-#P),AT(126,44),USE(SOC:CUIT)
                         STRING('CUIT:'),AT(118,182),USE(?STRING3)
                         STRING('IVA:<0DH,0AH>'),AT(118,188),USE(?STRING4)
                         STRING(@P##-########-#P),AT(129,182),USE(SOC:CUIT,,?SOC:CUIT:2)
                         STRING(@s30),AT(127,188,53),USE(TIP7:DECRIPCION,,?TIP7:DECRIPCION:2)
                       END
                       FORM,AT(16,5,182,278),USE(?unnamed:3)
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

ProgressMgr          StepLongClass                         ! Progress Manager
Previewer            PrintPreviewClass                     ! Print Previewer
TargetSelector       ReportTargetSelectorClass             ! Report Target Selector
XMLReporter          CLASS(XMLReportGenerator)             ! XML
Setup                  PROCEDURE(),DERIVED
                     END

HTMLReporter         CLASS(HTMLReportGenerator)            ! HTML
SetUp                  PROCEDURE(),DERIVED
                     END

PDFReporter          CLASS(PDFReportGenerator)             ! PDF
SetUp                  PROCEDURE(),DERIVED
                     END

TXTReporter          CLASS(TextReportGenerator)            ! TXT
Setup                  PROCEDURE(),DERIVED
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
  GlobalErrors.SetProcedureName('IMPRIMIR_PAGO_ANUAL')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:INGRESOS_FACTURA.Open                             ! File INGRESOS_FACTURA used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('IMPRIMIR_PAGO_ANUAL',ProgressWindow)       ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:INGRESOS_FACTURA, ?Progress:PctText, Progress:Thermometer, ProgressMgr, ING2:IDINGRESO_FAC)
  ThisReport.AddSortOrder(ING2:PK_INGRESOS_FACTURA)
  ThisReport.AddRange(ING2:IDINGRESO_FAC,GLO:PAGO)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:INGRESOS_FACTURA.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:INGRESOS_FACTURA.Close
  END
  IF SELF.Opened
    INIMgr.Update('IMPRIMIR_PAGO_ANUAL',ProgressWindow)    ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SYSTEM{PROP:PrintMode} = 3
  ReturnValue = PARENT.OpenReport()
  IF ReturnValue = Level:Benign
    SELF.Report{PROPPRINT:Extend}=True
  END
  RETURN ReturnValue


ThisWindow.SetStaticControlsAttributes PROCEDURE

  CODE
  PARENT.SetStaticControlsAttributes
  !XML STATIC
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagName,'String22')
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ING2:FECHA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ING2:FECHA,RepGen:XML,TargetAttr:TagName,'ING2:FECHA')
  SELF.Attribute.Set(?ING2:FECHA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagName,'String14')
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE')
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagName,'String16')
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:DIRECCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:DIRECCION,RepGen:XML,TargetAttr:TagName,'SOC:DIRECCION')
  SELF.Attribute.Set(?SOC:DIRECCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ING2:OBSERVACION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ING2:OBSERVACION,RepGen:XML,TargetAttr:TagName,'ING2:OBSERVACION')
  SELF.Attribute.Set(?ING2:OBSERVACION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ING2:MONTO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ING2:MONTO,RepGen:XML,TargetAttr:TagName,'ING2:MONTO')
  SELF.Attribute.Set(?ING2:MONTO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String37,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String37,RepGen:XML,TargetAttr:TagName,'String37')
  SELF.Attribute.Set(?String37,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ING2:FECHA:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ING2:FECHA:2,RepGen:XML,TargetAttr:TagName,'ING2:FECHA:2')
  SELF.Attribute.Set(?ING2:FECHA:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagName,'String26')
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE:2,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE:2')
  SELF.Attribute.Set(?SOC:NOMBRE:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagName,'String27')
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:DIRECCION:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:DIRECCION:2,RepGen:XML,TargetAttr:TagName,'SOC:DIRECCION:2')
  SELF.Attribute.Set(?SOC:DIRECCION:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ING2:OBSERVACION:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ING2:OBSERVACION:2,RepGen:XML,TargetAttr:TagName,'ING2:OBSERVACION:2')
  SELF.Attribute.Set(?ING2:OBSERVACION:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagName,'String25')
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ING2:MONTO:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ING2:MONTO:2,RepGen:XML,TargetAttr:TagName,'ING2:MONTO:2')
  SELF.Attribute.Set(?ING2:MONTO:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String36,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String36,RepGen:XML,TargetAttr:TagName,'String36')
  SELF.Attribute.Set(?String36,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ING2:IDRECIBO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ING2:IDRECIBO,RepGen:XML,TargetAttr:TagName,'ING2:IDRECIBO')
  SELF.Attribute.Set(?ING2:IDRECIBO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagName,'String19')
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?STRING1,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?STRING1,RepGen:XML,TargetAttr:TagName,'STRING1')
  SELF.Attribute.Set(?STRING1,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?STRING2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?STRING2,RepGen:XML,TargetAttr:TagName,'STRING2')
  SELF.Attribute.Set(?STRING2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?TIP7:DECRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?TIP7:DECRIPCION,RepGen:XML,TargetAttr:TagName,'TIP7:DECRIPCION')
  SELF.Attribute.Set(?TIP7:DECRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:CUIT,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:CUIT,RepGen:XML,TargetAttr:TagName,'SOC:CUIT')
  SELF.Attribute.Set(?SOC:CUIT,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?STRING3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?STRING3,RepGen:XML,TargetAttr:TagName,'STRING3')
  SELF.Attribute.Set(?STRING3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?STRING4,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?STRING4,RepGen:XML,TargetAttr:TagName,'STRING4')
  SELF.Attribute.Set(?STRING4,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:CUIT:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:CUIT:2,RepGen:XML,TargetAttr:TagName,'SOC:CUIT:2')
  SELF.Attribute.Set(?SOC:CUIT:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?TIP7:DECRIPCION:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?TIP7:DECRIPCION:2,RepGen:XML,TargetAttr:TagName,'TIP7:DECRIPCION:2')
  SELF.Attribute.Set(?TIP7:DECRIPCION:2,RepGen:XML,TargetAttr:TagValueFromText,True)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  LOC:LETRAS =PKSNumTexto(PAG:MONTO)
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:detail)
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


PDFReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentInfo('CW Report','Gestion','IMPRIMIR_PAGO','IMPRIMIR_PAGO','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True


TXTReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetMargin(0,0,0,0)
  SELF.SetPageLen(0)
  SELF.SetCheckBoxString('[X]','[_]')
  SELF.SetRadioButtonString('(*)','(_)')
  SELF.SetLineString('|','|','-','-','/','\','\','/')
  SELF.SetTextFillString(' ',CHR(176),CHR(177),CHR(178),CHR(219))
  SELF.SetOmitGraph(False)

!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
GENERAR_FACTURA_ANUAL PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(SOCIOS)
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager

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
  GlobalErrors.SetProcedureName('GENERAR_FACTURA_ANUAL')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:COBERTURA.Open                                    ! File COBERTURA used by this procedure, so make sure it's RelationManager is open
  Relate:INGRESOS_FACTURA.Open                             ! File INGRESOS_FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('GENERAR_FACTURA_ANUAL',ProgressWindow)     ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisProcess.Init(Process:View, Relate:SOCIOS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, SOC:IDSOCIO)
  ThisProcess.AddSortOrder(SOC:PK_SOCIOS)
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(SOCIOS,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:COBERTURA.Close
    Relate:INGRESOS_FACTURA.Close
    Relate:RANKING.Close
    Relate:SOCIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('GENERAR_FACTURA_ANUAL',ProgressWindow)  ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  !!!
  IF SOC:BAJA = 'NO' AND SOC:BAJA_TEMPORARIA = 'NO' THEN 
      ING2:IDSOCIO        = SOC:IDSOCIO
      ING2:IDSUBCUENTA    = 1
      ING2:OBSERVACION    = GLO:CARGA_sTRING
      !!
      !!! busco el monto y sumo el total 
      mes$ = month(today())
      ano$ = year(today())
      !! Calculo la cantidad de meses
      cant_mes$ = 13 - mes$
      !!! busco el monto y sumo el total 
      COB:IDCOBERTURA = 1 
      ACCESS:COBERTURA.TryFetch(COB:PK_COBERTURA)
      ING2:MONTO = COB:MONTO * cant_mes$
      !!!!   
      ING2:FECHA        = TODAY() 
      ING2:HORA         =CLOCK() 
      ING2:MES          = MONTH(TODAY())
      ING2:ANO        = YEAR(TODAY())
      ING2:PERIODO    = ING2:ANO&FORMAT(ING2:MES,@N02)
      ING2:IDUSUARIO  = GLO:IDUSUARIO
      ING2:MES_HASTA  = 12
      !!!! LLAMA A CARGAR ID RECIBO     
      GLO:RECIBO  = GLO:RECIBO + 1
      CARGAR_RECIBO
      
      !!!!!!!!!!!!!!11
      ING2:SUCURSAL       = GLO:SUCURSAL
      ING2:IDRECIBO       = GLO:RECIBO           
      
      Add(INGRESOS_FACTURA) 
      if errorcode() then
          MESSAGE(error())
      else 
          !!! imprimir Recibo
          !! SACA ULTIMO NUMERO
          RAN:C1 = ''
          RANKING{PROP:SQL} = 'DELETE FROM RANKING'
          RANKING{PROP:SQL} = 'SELECT COUNT(ingresos_factura.idingreso_fac)FROM ingresos_FACTURA'
          NEXT(RANKING)
          CANTIDAD# = RAN:C1
          GLO:PAGO = CANTIDAD# 
          IMPRIMIR_PAGO_ANUAL
      end 
  end     
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Window
!!! Window
!!! </summary>
FACTURA_ANUAL_TOTAL PROCEDURE 

QuickWindow          WINDOW('Proceso de Carga Anual '),AT(,,260,161),FONT('Microsoft Sans Serif',8,,FONT:regular, |
  CHARSET:DEFAULT),RESIZE,CENTER,GRAY,IMM,HLP('FACTURA_ANUAL_TOTAL'),SYSTEM
                       BUTTON('&OK'),AT(64,142,49,14),USE(?Ok),LEFT,ICON('WAOK.ICO'),FLAT,MSG('Accept operation'), |
  TIP('Accept Operation')
                       BUTTON('&Cancelar'),AT(154,142,62,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Operation'), |
  TIP('Cancel Operation')
                       PROMPT('AÑO  A GENERAR :'),AT(17,9),USE(?GLO:ANO:Prompt)
                       COMBO(@n-14),AT(87,5,73),USE(GLO:ANO),DROP(10),FROM('2005|2006|2007|2008|2009|2010|2011' & |
  '|2012|2015|2016')
                       LINE,AT(-1,33,259,0),USE(?LINE1),COLOR(COLOR:Black)
                       TEXT,AT(87,42,170,84),USE(GLO:CARGA_sTRING)
                       PROMPT('Texto Detalle Factura:<0DH,0AH>'),AT(11,41,73,10),USE(?PROMPT1)
                       LINE,AT(0,137,259,0),USE(?LINE2),COLOR(COLOR:Black)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
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
  GlobalErrors.SetProcedureName('FACTURA_ANUAL_TOTAL')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Ok
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Ok,RequestCancelled)                    ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Ok,RequestCompleted)                    ! Add the close control to the window manger
  END
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('FACTURA_ANUAL_TOTAL',QuickWindow)          ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  !! LIMPIA VARIABLES
  GLO:CARGA_sTRING = '' 
  GLO:RECIBO = 0
  GLO:SUCURSAL = 0
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.Opened
    INIMgr.Update('FACTURA_ANUAL_TOTAL',QuickWindow)       ! Save window data to non-volatile store
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
    OF ?Ok
      ThisWindow.Update()
      GENERAR_FACTURA_ANUAL()
      ThisWindow.Reset
    END
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
    END
  ReturnValue = PARENT.TakeWindowEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Form INGRESOS_FACTURA
!!! </summary>
UpdateINGRESOS_FACTURA PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
History::ING2:Record LIKE(ING2:RECORD),THREAD
QuickWindow          WINDOW('Form INGRESOS_FACTURA'),AT(,,513,237),FONT('Microsoft Sans Serif',8,,FONT:regular, |
  CHARSET:DEFAULT),RESIZE,CENTER,GRAY,IMM,MDI,HLP('UpdateINGRESOS_FACTURA'),SYSTEM
                       BUTTON('&OK'),AT(89,214,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,DISABLE,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancelar'),AT(167,214,61,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                       PROMPT('SUCURSAL:'),AT(9,34),USE(?ING2:SUCURSAL:Prompt),TRN
                       PROMPT('IDRECIBO:'),AT(89,33),USE(?ING2:IDRECIBO:Prompt),TRN
                       ENTRY(@n-4),AT(55,33,28,10),USE(ING2:SUCURSAL)
                       ENTRY(@n-14),AT(131,33,64,10),USE(ING2:IDRECIBO)
                       PROMPT('IDSOCIO:'),AT(9,9),USE(?ING2:IDSOCIO:Prompt),TRN
                       ENTRY(@n-14),AT(45,9,50,10),USE(ING2:IDSOCIO)
                       PROMPT('Detalle:'),AT(9,126),USE(?ING2:OBSERVACION:Prompt),TRN
                       PROMPT('MONTO:'),AT(17,85,47,18),USE(?ING2:MONTO:Prompt),FONT(,12),TRN
                       ENTRY(@n$-10.2),AT(77,83,78,18),USE(ING2:MONTO),FONT(,12),DISABLE
                       BUTTON('...'),AT(100,7,12,12),USE(?CallLookup)
                       ENTRY(@s100),AT(120,9,173,10),USE(SOC:NOMBRE),TRN
                       BUTTON('Calcular'),AT(55,57,109),USE(?BUTTON1)
                       TEXT,AT(77,112,197,86),USE(ING2:OBSERVACION)
                       LINE,AT(4,52,309,0),USE(?LINE1),COLOR(COLOR:Black)
                       LINE,AT(3,77,308,0),USE(?LINE2),COLOR(COLOR:Black)
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeCompleted          PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
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

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'View Record'
  OF InsertRecord
    ActionMessage = 'Record Will Be Added'
  OF ChangeRecord
    ActionMessage = 'Record Will Be Changed'
  OF DeleteRecord
    GlobalErrors.Throw(Msg:DeleteIllegal)
    RETURN
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  CASE SELF.Request
  OF ChangeRecord
    QuickWindow{PROP:Text} = QuickWindow{PROP:Text} & '  (' & ING2:IDINGRESO_FAC & ')' ! Append status message to window title text
  OF InsertRecord
    QuickWindow{PROP:Text} = QuickWindow{PROP:Text} & '  (New)'
  END
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateINGRESOS_FACTURA')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?OK
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(ING2:Record,History::ING2:Record)
  SELF.AddHistoryField(?ING2:SUCURSAL,11)
  SELF.AddHistoryField(?ING2:IDRECIBO,12)
  SELF.AddHistoryField(?ING2:IDSOCIO,2)
  SELF.AddHistoryField(?ING2:MONTO,5)
  SELF.AddHistoryField(?ING2:OBSERVACION,4)
  SELF.AddUpdateFile(Access:INGRESOS_FACTURA)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:COBERTURA.Open                                    ! File COBERTURA used by this procedure, so make sure it's RelationManager is open
  Relate:INGRESOS_FACTURA.Open                             ! File INGRESOS_FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:INGRESOS_FACTURA
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.DeleteAction = Delete:None                        ! Deletes not allowed
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?ING2:SUCURSAL{PROP:ReadOnly} = True
    ?ING2:IDRECIBO{PROP:ReadOnly} = True
    ?ING2:IDSOCIO{PROP:ReadOnly} = True
    ?ING2:MONTO{PROP:ReadOnly} = True
    DISABLE(?CallLookup)
    ?SOC:NOMBRE{PROP:ReadOnly} = True
    DISABLE(?BUTTON1)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateINGRESOS_FACTURA',QuickWindow)       ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:COBERTURA.Close
    Relate:INGRESOS_FACTURA.Close
    Relate:RANKING.Close
    Relate:SOCIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateINGRESOS_FACTURA',QuickWindow)    ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
  END
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    SelectSOCIOS
    ReturnValue = GlobalResponse
  END
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
    CASE ACCEPTED()
    OF ?OK
      ING2:IDSUBCUENTA  = 1
      ING2:FECHA        = TODAY() 
      ING2:HORA         =CLOCK() 
      ING2:MES          = MONTH(TODAY())
      ING2:ANO        = YEAR(TODAY())
      ING2:PERIODO    = ING2:ANO&FORMAT(ING2:MES,@N02)
      ING2:IDUSUARIO  = GLO:IDUSUARIO
      ING2:MES_HASTA  = 12
      
    OF ?BUTTON1
      mes$ = month(today())
      ano$ = year(today())
      !! Calculo la cantidad de meses
      cant_mes$ = 13 - mes$
      !!! busco el monto y sumo el total 
      COB:IDCOBERTURA = 1 
      ACCESS:COBERTURA.TryFetch(COB:PK_COBERTURA)
      ING2:MONTO = COB:MONTO * cant_mes$
      ENABLE(?OK)
      DISABLE(?BUTTON1)
      ThisWindow.RESET(1) 
      !!!!!!!!!!!!!!!!!!!!!!!!!!!!!11
      
      
      
      
      
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    OF ?ING2:IDSOCIO
      SOC:IDSOCIO = ING2:IDSOCIO
      IF Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          ING2:IDSOCIO = SOC:IDSOCIO
        ELSE
          SELECT(?ING2:IDSOCIO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:INGRESOS_FACTURA.TryValidateField(2)       ! Attempt to validate ING2:IDSOCIO in INGRESOS_FACTURA
        SELECT(?ING2:IDSOCIO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?ING2:IDSOCIO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?ING2:IDSOCIO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup
      ThisWindow.Update()
      SOC:IDSOCIO = ING2:IDSOCIO
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        ING2:IDSOCIO = SOC:IDSOCIO
      END
      ThisWindow.Reset(1)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeCompleted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeCompleted()
  !! SACA ULTIMO NUMERO
  RAN:C1 = ''
  RANKING{PROP:SQL} = 'DELETE FROM RANKING'
  RANKING{PROP:SQL} = 'SELECT COUNT(ingresos_factura.idingreso_fac)FROM ingresos_FACTURA'
  NEXT(RANKING)
  CANTIDAD# = RAN:C1
  
  GLO:PAGO = CANTIDAD# 
  
  IMPRIMIR_PAGO_ANUAL
  
  
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
    END
  ReturnValue = PARENT.TakeWindowEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

