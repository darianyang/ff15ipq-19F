#!/bin/bash
echo "#W4F V00 PHI PSI Angles" > rama.dat
for i in {1..100}; do
  COMMAND="           parm W4F_V.top \n"
  COMMAND="${COMMAND} trajin CONFS/Conf${i}.pdb \n"
  COMMAND="${COMMAND} dihedral phi @5 @7 @9  @29 out phipsi.dat \n"
  COMMAND="${COMMAND} dihedral psi @7 @9 @29  @31 out phipsi.dat \n"
  COMMAND="${COMMAND} go"
  echo -e ${COMMAND} | cpptraj >> cpp_rama.out
  cat phipsi.dat | tail -n +2 >> rama.dat
done

python ../../scripts/plot_rama.py

rm phipsi.dat
