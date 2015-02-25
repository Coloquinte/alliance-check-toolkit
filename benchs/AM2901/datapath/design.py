#!/usr/bin/env python

try:
  import sys
  import CRL
  import stratus
except ImportError, e:
  serror = str(e)
  if serror.startswith('No module named'):
    module = serror.split()[-1]
    print '[ERROR] The <%s> python module or symbol cannot be loaded.' % module
    print '        Please check the integrity of the <coriolis> package.'
    sys.exit(1)
  if str(e).find('cannot open shared object file'):
    library = serror.split(':')[0]
    print '[ERROR] The <%s> shared library cannot be loaded.' % library
    print '        Under RHEL 6, you must be under devtoolset-2.'
    print '        (scl enable devtoolset-2 bash)'
  sys.exit(1)
except Exception, e:
  print '[ERROR] A strange exception occurred while loading the basic Coriolis/Python'
  print '        modules. Something may be wrong at Python/C API level.\n'
  print '        %s' % e
  sys.exit(2)


def ScriptMain ( **kw ):
  editor = None
  if kw.has_key('editor') and kw['editor']:
    editor = kw['editor']
    stratus.setEditor( editor )

  cell = stratus.buildModel( 'amd2901_dpt' , stratus.DoNetlist|stratus.DoLayout )
  cell = stratus.buildModel( 'amd2901_core', stratus.DoNetlist|stratus.DoLayout )
  cell = stratus.buildModel( 'amd2901_chip', stratus.DoNetlist )
  return cell


if __name__ == "__main__" :
  kw           = {}
  success      = ScriptMain( **kw )
  shellSuccess = 0
  if not success: shellSuccess = 1

  sys.exit( shellSuccess )
