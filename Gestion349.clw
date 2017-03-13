

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPRHTML.INC'),ONCE
   INCLUDE('ABPRPDF.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('abprtext.inc'),ONCE
   INCLUDE('abprxml.inc'),ONCE
   INCLUDE('abrppsel.inc'),ONCE

                     MAP
                       INCLUDE('GESTION349.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
IMPRIMIR_RECIBOS_EMITIDOS2 PROCEDURE 

Progress:Thermometer BYTE                                  ! 
L:NroReg             LONG                                  ! 
Process:View         VIEW(INGRESOS)
                       PROJECT(ING:FECHA)
                       PROJECT(ING:IDRECIBO)
                       PROJECT(ING:MONTO)
                       PROJECT(ING:OBSERVACION)
                       PROJECT(ING:SUCURSAL)
                       PROJECT(ING:IDSUBCUENTA)
                       PROJECT(ING:IDPROVEEDOR)
                       JOIN(SUB:INTEG_113,ING:IDSUBCUENTA)
                       END
                       JOIN(PRO2:PK_PROVEEDOR,ING:IDPROVEEDOR)
                         PROJECT(PRO2:DESCRIPCION)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(229,1833,7740,8146),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',8,,FONT:regular,CHARSET:ANSI), |
  THOUS
                       HEADER,AT(219,458,7771,1385),USE(?Header)
                         IMAGE('logo.jpg'),AT(0,42,2010,1073),USE(?Image1)
                         STRING('RECIBOS EMITIDOS '),AT(2938,656),USE(?String7),FONT(,14,,FONT:bold+FONT:underline), |
  TRN
                         STRING(@D6),AT(4990,938),USE(FECHA_HASTA),RIGHT(1)
                         LINE,AT(0,1146,7813,0),USE(?Line2),COLOR(COLOR:Black)
                         STRING('Fecha'),AT(1354,1177),USE(?String14),TRN
                         STRING('Proveedor'),AT(2344,1177),USE(?String13),TRN
                         STRING('Detalle'),AT(5302,1177),USE(?String15),TRN
                         STRING('Nº Recibo'),AT(208,1177),USE(?String12),TRN
                         STRING('Monto'),AT(7292,1177),USE(?String16),TRN
                         LINE,AT(0,1354,7813,0),USE(?Line3),COLOR(COLOR:Black)
                         STRING('Fecha Desde: '),AT(2188,938),USE(?String8),TRN
                         STRING('Fecha Hasta:'),AT(4260,938),USE(?String9),TRN
                         STRING(@D6),AT(2906,938),USE(FECHA_DESDE),RIGHT(1)
                       END
Detail                 DETAIL,AT(0,0,,240),USE(?Detail)
                         STRING(@n-10),AT(354,21),USE(ING:IDRECIBO)
                         STRING(@p####-p),AT(21,21),USE(ING:SUCURSAL)
                         STRING(@s50),AT(1771,0,2083,208),USE(PRO2:DESCRIPCION)
                         STRING(@s50),AT(3958,0,3021,208),USE(ING:OBSERVACION)
                         STRING(@n$-13.2),AT(6979,21),USE(ING:MONTO),RIGHT(12)
                         LINE,AT(10,208,7719,0),USE(?Line1),COLOR(COLOR:Black)
                         STRING(@d17),AT(1156,21),USE(ING:FECHA)
                       END
                       FOOTER,AT(240,9990,7740,1000),USE(?Footer)
                         STRING('Total Monto Recibos en Periodo:'),AT(1833,10),USE(?String20),TRN
                         STRING(@n$-13.2),AT(3490,10),USE(ING:MONTO,,?ING:MONTO:2),SUM
                         LINE,AT(0,208,7708,0),USE(?Line3:2),COLOR(COLOR:Black)
                         STRING('Fecha del Reporte:'),AT(0,313),USE(?EcFechaReport),FONT('Courier New',7),TRN
                         STRING('DatoEmpresa'),AT(3583,313),USE(?DatoEmpresa),FONT('Courier New',7),TRN
                         STRING('Evolution_Paginas_'),AT(6771,313),USE(?PaginaNdeX),FONT('Courier New',7),TRN
                       END
                       FORM,AT(240,469,7750,10521),USE(?Form)
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
             Evo::Any  = FECHA_HASTA
             Evo::Any &= WHAT(EVO:QDatos,2)
             Evo::Any  = FECHA_DESDE
             Evo::Any &= WHAT(EVO:QDatos,3)
             Evo::Any  = ING:IDRECIBO
             Evo::Any &= WHAT(EVO:QDatos,4)
             Evo::Any  = ING:SUCURSAL
             Evo::Any &= WHAT(EVO:QDatos,5)
             Evo::Any  = PRO2:DESCRIPCION
             Evo::Any &= WHAT(EVO:QDatos,6)
             Evo::Any  = ING:OBSERVACION
             Evo::Any &= WHAT(EVO:QDatos,7)
             Evo::Any  = ING:MONTO
             Evo::Any &= WHAT(EVO:QDatos,8)
             Evo::Any  = ING:FECHA
             Evo::Any &= WHAT(EVO:QDatos,9)
             Evo::Any  = ING:MONTO
        ADD(EVO:QDatos)
        ASSERT (NOT ErrorCode())
!Fin Codigo  CW Templates
!------------------------------------------------------------------------------------------------------------
CargaParametros ROUTINE
        FREE(QHList)
           QHL:Id      = 1
           QHL:Nombre  = 'FECHA_HASTA'
           QHL:Longitud= 100
           QHL:Pict    = '@d6'
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
           QHL:Nombre  = 'FECHA_DESDE'
           QHL:Longitud= 100
           QHL:Pict    = '@d6'
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
           QHL:Nombre  = 'IDRECIBO'
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
           QHL:Id      = 4
           QHL:Nombre  = 'SUCURSAL'
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
           QHL:Id      = 5
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
           QHL:Id      = 6
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
           QHL:Id      = 7
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
           QHL:Id      = 8
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
           QHL:Id      = 9
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
        !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        FREE(QPar)
        Q:FieldPar  = '1,2,3,4,5,6,7,8,9,'
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
        Q:FieldPar  = 9
        ADD(QPar)!.7.
        Q:FieldPar  = 'FREE'
        ADD(QPar)   !.8.
        Titulo = 'Recibos Emitidos'
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
        ADD(QPar)   ! 29 Gestion349.clw
        
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
  GlobalErrors.SetProcedureName('IMPRIMIR_RECIBOS_EMITIDOS2')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:INGRESOS.Open                                     ! File INGRESOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('IMPRIMIR_RECIBOS_EMITIDOS2',ProgressWindow) ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:INGRESOS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, ING:FECHA)
  ThisReport.AddSortOrder(ING:IDX_INGRESOS_FECHA)
  ThisReport.AddRange(ING:FECHA,FECHA_DESDE,FECHA_HASTA)
  ThisReport.AppendOrder('ING:SUCURSAL,ING:IDRECIBO')
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:INGRESOS.SetQuickScan(1,Propagate:OneMany)
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
    Relate:INGRESOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('IMPRIMIR_RECIBOS_EMITIDOS2',ProgressWindow) ! Save window data to non-volatile store
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
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagName,'String7')
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FECHA_HASTA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FECHA_HASTA,RepGen:XML,TargetAttr:TagName,'FECHA_HASTA')
  SELF.Attribute.Set(?FECHA_HASTA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagName,'String14')
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagName,'String13')
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagName,'String15')
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String12,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String12,RepGen:XML,TargetAttr:TagName,'String12')
  SELF.Attribute.Set(?String12,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagName,'String16')
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagName,'String8')
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String9,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String9,RepGen:XML,TargetAttr:TagName,'String9')
  SELF.Attribute.Set(?String9,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FECHA_DESDE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FECHA_DESDE,RepGen:XML,TargetAttr:TagName,'FECHA_DESDE')
  SELF.Attribute.Set(?FECHA_DESDE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ING:IDRECIBO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ING:IDRECIBO,RepGen:XML,TargetAttr:TagName,'ING:IDRECIBO')
  SELF.Attribute.Set(?ING:IDRECIBO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ING:SUCURSAL,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ING:SUCURSAL,RepGen:XML,TargetAttr:TagName,'ING:SUCURSAL')
  SELF.Attribute.Set(?ING:SUCURSAL,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PRO2:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PRO2:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'PRO2:DESCRIPCION')
  SELF.Attribute.Set(?PRO2:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ING:OBSERVACION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ING:OBSERVACION,RepGen:XML,TargetAttr:TagName,'ING:OBSERVACION')
  SELF.Attribute.Set(?ING:OBSERVACION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ING:MONTO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ING:MONTO,RepGen:XML,TargetAttr:TagName,'ING:MONTO')
  SELF.Attribute.Set(?ING:MONTO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ING:FECHA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ING:FECHA,RepGen:XML,TargetAttr:TagName,'ING:FECHA')
  SELF.Attribute.Set(?ING:FECHA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagName,'String20')
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ING:MONTO:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ING:MONTO:2,RepGen:XML,TargetAttr:TagName,'ING:MONTO:2')
  SELF.Attribute.Set(?ING:MONTO:2,RepGen:XML,TargetAttr:TagValueFromText,True)
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
  SELF.SetPageLen(0)
  SELF.SetCheckBoxString('[X]','[_]')
  SELF.SetRadioButtonString('(*)','(_)')
  SELF.SetLineString('|','|','-','-','/','\','\','/')
  SELF.SetTextFillString(' ',CHR(176),CHR(177),CHR(178),CHR(219))
  SELF.SetOmitGraph(False)


PDFReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentInfo('CW Report','Gestion','IMPRIMIR_RECIBOS_EMITIDOS2','IMPRIMIR_RECIBOS_EMITIDOS2','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

