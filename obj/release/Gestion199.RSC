Gestion$Gestion199 $   Progress... P1$PROGRESSWINDOW F                  ;   ø                                                  @                                 ?PROGRESS:THERMOMETER        #                Æ         o                        Y@      ?PROGRESS:USERSTRING c            ū             
       ś                       ?PROGRESS:PCTTEXT »            Q            
       P                     Cancel ?PROGRESS:CANCEL 	               Ŗ  -   *   2                                      £                         P1$REPORT .    	     @  
   ’’’’  Arial ø         č  K
  j        0      %           ?HEADER ]               ä      č  č  j  c                                Logo.JPG ?IMAGE1 L             Ü  
      Ģ  ņ  Ó            INFORME DEL PAGO DE  CUOTAS ?STRING1        ’’’’¼"  „            3  ¦  A              <                 s30 ?SOC:NOMBRE e                        +                                                n-5 ?GLO:ANO_HASTA        |            ś  	  ’  5           ö                                  PERIODO HASTA: ?STRING33 Ų            r  S  5            c                     n-5 ?GLO:MES_HASTA        B            Ą  Ļ  į  5           ¼                                  PERIODO DESDE: ?STRING32             8  .  5            )                     n-5 ?GLO:MES        ’          	       Ü  5                                              n-5 ?GLO:ANO        c          
   ķ  ö  Š  5            é                                  ?LINE1     ’’’’’’’’©             P  
   D  U      W           Matricula: ?STRING4                                                   s7 ?SOC:MATRICULA                       ģ  ū                é                                  ?DETAIL Ļ             U  Ä      
   
   `  ō                                n-7 ?FAC:IDFACTURA        +            ¬  »  u  
            Ø                                  n-3 ?FAC:MES                      "  I                                                n-5 ?FAC:ANO        ’                ų	              |                                  n$-10.2 ?FAC:TOTAL       d	             ė  ö  -               ć                                  ESTADO: ?STRING32:2 ½	            X	  E               P	                     s10 ?FAC:ESTADO        !
            Ø	  “	  Õ               ¤	                                  ?LINE4     ’’’’’’’’f
             
  
   å   K      
           Nŗ PAGO: ?STRING28 »
            \
  
   ś             S
                     s2 ?PAG:MES        &             ©
  ²
  Ł	  ś             ¦
                                  n-7 ?PAG:IDPAGOS                         °  ś                                               MES: ?STRING29 ×            |  .  ś             w                     FECHA: ?STRING31 &            Ķ     ś             Ę                     AŃO: ?STRING30 {              _  ś                                  s4 ?PAG:ANO        ä             i  r  h  ś             f                                  d17 ?PAG:FECHA        J             Š  Ū  H  ś             Ģ                                  ?LINE1:2     ’’’’’’’’             5  
   Ź  U      >           MES: ?STRING13 ą              Ņ               |                     TOTAL REC: ?STRING15 /             Ö  ÷  
             Ė                     AŃO: ?STRING14          !   %  µ                                     Nŗ RECIBO S.: ?STRING10            "   }  
   
             o                     ?FOOTER `          #   Ē  1      č  Ų%  j  č                                CANT. REG. : ?STRING17          $   '  
                                      MONTO TOTAL: ?STRING18 ę         %   ~    
             q                     n$-10.2 ?FAC:TOTAL:2       J          &   Š  Ż  Ā  
   ŗ  Š       Č                                 ?LINE3     ’’’’’’’’ŗ          '   7  
   Ū   g      >           Fecha del Reporte: ?ECFECHAREPORT ®    ’’’’’’’’Courier New /         (        .            |                   DatoEmpresa ?DATOEMPRESA #    ’’’’’’’’Courier New Ŗ         )     M  .            ś                   Evolution_Paginas_ ?PAGINANDEX     ’’’’’’’’Courier New 	         *     ł  .            o                   n-14 ?FAC:IDFACTURA:2                   +   ļ     k  
             ź                                 ?FORM             ,   Z          č  č  j  Ų%            P1$GOL_WO ±    ’’’’  Tahoma Ø               ģ   +   >    ”                                                                              Mail.ico ?IMGOUT ~             6              -           ?PROGOUTLOOK #Č             q      &   	   ¤   	                     Y@     ?GROUP1               Ą  &      ¤   	                                       C  ’’         Generando Archivos de Mail ?STROUT               ;  L                                      P1$WGOLPROMPT ”    ’’’’¼  Tahoma                      P   (                                                                                  ?GROUP_GOL                          L                                         ’’         mail.ico ?IMAGE_GOL Ļ                                      ?GROUP2             Ē  $      X   $                                       A           Pagina Desde: ?PROMPT_GOL 
             5  +                '                     n02 ?LOCE::GOLDESDE        -                 \         
                                                  š?      Y@          š?    Pagina Hasta: ?PROMPT_GOL2 
                +                                     n02 ?LOCE::GOLHASTA                       q    \         
                                   m               š?      Y@          š?    Enviar ?ENVIAR wizok.ico 	                 ;   2                                      ž                       Cancelar ?CANCELAR wizcncl.ico 	           	     S   ;   2                                      w                       