
from   __future__ import print_function
import sys
import traceback
import CRL
import helpers
helpers.loadUserSettings()
from   helpers.io import ErrorMessage, WarningMessage
from   helpers    import trace, l, u, n
import plugins
from   Hurricane  import DbU, Breakpoint
from   plugins.alpha.block.block          import Block
from   plugins.alpha.block.configuration  import IoPin, GaugeConf
from   plugins.alpha.core2chip.libresocio import CoreToChip
from   plugins.alpha.chip.configuration   import ChipConf
from   plugins.alpha.chip.chip            import Chip


af = CRL.AllianceFramework.get()


def scriptMain ( **kw ):
    """The mandatory function to be called by Coriolis CGT/Unicorn."""
    global af
    rvalue = True
    try:
       #helpers.setTraceLevel( 540 )
       #Breakpoint.setStopLevel( 99 )
        buildChip = True
        cell, editor = plugins.kwParseMain( **kw )
        cell = af.getCell( 'adder', CRL.Catalog.State.Logical )
        if editor:
            editor.setCell( cell ) 
            editor.setDbuMode( DbU.StringModePhysical )
        ioPadsSpec = [ (IoPin.WEST , None    , 'a_0'        , 'a(0)'   , 'a(0)'  )
                     , (IoPin.WEST , None    , 'a_1'        , 'a(1)'   , 'a(1)'  )
                     , (IoPin.WEST , None    , 'a_2'        , 'a(2)'   , 'a(2)'  )
                     , (IoPin.WEST , None    , 'a_3'        , 'a(3)'   , 'a(3)'  )
                     , (IoPin.WEST , None    , 'power_0'    , 'vdd'    )
                     , (IoPin.WEST , None    , 'ground_0'   , 'vss'    )
                     , (IoPin.WEST , None    , 'b_0'        , 'b(0)'   , 'b(0)'  )
                     , (IoPin.WEST , None    , 'b_1'        , 'b(1)'   , 'b(1)'  )
                     , (IoPin.WEST , None    , 'b_2'        , 'b(2)'   , 'b(2)'  )
                     , (IoPin.WEST , None    , 'b_3'        , 'b(3)'   , 'b(3)'  )
                     , (IoPin.WEST , None    , 'ioground_0' , 'iovss'  )
                     , (IoPin.WEST , None    , 'iopower_0'  , 'iovdd'  )
                     , (IoPin.SOUTH, None    , 'iopower_1'  , 'iovdd'  )
                     , (IoPin.SOUTH, None    , 'ioground_1' , 'iovss'  )
                     , (IoPin.EAST , None    , 'iopower_2'  , 'iovdd'  )
                     , (IoPin.EAST , None    , 'ioground_2' , 'iovss'  )
                     , (IoPin.EAST , None    , 'f_0'        , 'f(0)'   , 'f(0)'   )
                     , (IoPin.EAST , None    , 'f_1'        , 'f(1)'   , 'f(1)'   )
                     , (IoPin.EAST , None    , 'f_2'        , 'f(2)'   , 'f(2)'   )
                     , (IoPin.EAST , None    , 'f_3'        , 'f(3)'   , 'f(3)'   )
                     , (IoPin.NORTH, u(700.0), 'm_clock'    , 'm_clock', 'm_clock' )
                     , (IoPin.NORTH, u(800.0), 'p_reset'    , 'p_reset', 'p_reset' )
                     ]
        ioPinsSpec = [ (IoPin.WEST |IoPin.A_BEGIN, 'a({})'  , u(  6.6), u( 6.6), 4)
                     , (IoPin.WEST |IoPin.A_BEGIN, 'b({})'  , u(  3.3), u( 6.6), 4)
                     , (IoPin.EAST |IoPin.A_BEGIN, 'f({})'  , u(  6.6), u( 6.6), 4)
                     , (IoPin.NORTH|IoPin.A_BEGIN, 'p_reset', u( 33.0),      0 , 1)
                     , (IoPin.NORTH|IoPin.A_BEGIN, 'm_clock', u( 66.0),      0 , 1)
                     ]
       #ioPinsSpec = []
        adderConf = ChipConf( cell, ioPins=ioPinsSpec, ioPads=ioPadsSpec ) 
        adderConf.cfg.viewer.pixelThreshold       = 5
        adderConf.cfg.etesian.bloat               = 'nsxlib'
        adderConf.cfg.etesian.uniformDensity      = True
        adderConf.cfg.etesian.aspectRatio         = 1.0
       # etesian.spaceMargin is ignored if the coreSize is directly set.
        adderConf.cfg.etesian.spaceMargin         = 0.20
        adderConf.cfg.anabatic.searchHalo         = 2
        adderConf.cfg.anabatic.globalIterations   = 20
        adderConf.cfg.anabatic.topRoutingLayer    = 'METAL5'
        adderConf.cfg.katana.hTracksReservedLocal = 6
        adderConf.cfg.katana.vTracksReservedLocal = 3
        adderConf.cfg.katana.hTracksReservedMin   = 3
        adderConf.cfg.katana.vTracksReservedMin   = 1
        adderConf.cfg.block.spareSide             = u(200)
       #adderConf.cfg.chip.padCoreSide            = 'North'
       #adderConf.cfg.chip.use45corners           = False
        adderConf.cfg.chip.useAbstractPads        = True
        adderConf.editor              = editor
        adderConf.useSpares           = False
        adderConf.useClockTree        = False
        adderConf.useHFNS             = False
        adderConf.bColumns            = 2
        adderConf.bRows               = 3
        adderConf.chipName            = 'chip'
        adderConf.chipConf.ioPadGauge = 'LibreSOCIO'
        adderConf.coreSize            = ( u( 150.0), u( 400.0) )
        adderConf.chipSize            = ( u( 700.0), u(1508.0) )
        if buildChip:
            arlet6502ToChip = CoreToChip( adderConf )
            arlet6502ToChip.buildChip()
            chipBuilder = Chip( adderConf )
            chipBuilder.doChipFloorplan()
            rvalue = chipBuilder.doPnR()
            chipBuilder.save()
            CRL.Gds.save( adderConf.chip )
        else:
            blockBuilder = Block( adderConf )
            rvalue = blockBuilder.doPnR()
            blockBuilder.save()
            CRL.Gds.save( adderConf.cell )
    except Exception, e:
        helpers.io.catch( e )
        rvalue = False
    sys.stdout.flush()
    sys.stderr.flush()
    return rvalue