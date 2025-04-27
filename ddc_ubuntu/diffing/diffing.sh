#!/bin/bash

# Assumes you have ran DDC with Temuring 21.0.5 and a local infected build
cp -r ../from_21.0.5-tem/stage2_21.0.5-tem/ .
cp -r ../from_21.0.5-infected_local/stage2_21.0.5-infected_local/ .

# Manually extract lib/modules JImage since diffoscope does not have support for it
jimage extract --dir stage2_21.0.5-tem/lib/modules_extracted stage2_21.0.5-tem/lib/modules
jimage extract --dir stage2_21.0.5-infected_local/lib/modules_extracted stage2_21.0.5-infected_local/lib/modules

# Save diff between all files
diff -r stage2_21.0.5-tem/ stage2_21.0.5-infected_local/ > diff_stage2_from_21.0.5-infected_stage2_from_21.0.5-tem.diff

# Remove lib/modules to avoid huge binary diff
rm stage2_21.0.5-tem/lib/modules
rm stage2_21.0.5-infected_local/lib/modules

# Save detailed diffoscope result
diffoscope --exclude-directory-metadata=recursive stage2_21.0.5-tem/ stage2_21.0.5-infected_local/ > diffoscope_stage2_from_21.0.5-infected_stage2_from_21.0.5-tem.diff
