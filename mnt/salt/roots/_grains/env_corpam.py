import os

newenv = {}
for line in open('/etc/profile.d/corpam.sh', 'r'):
   if line.startswith('CA_'):
      try:
         k,v = line.strip().split('=',1)
      except:
         continue  # bad line format, skip it
      newenv[k] = v
os.environ.update(newenv)
