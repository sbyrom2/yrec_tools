'''
Intended use:
- Read a master set of YREC namelist files, where both .nml1 and .nml2 are required. 
- Replace parameter assignments given in command-line interface (CLI).
- Write out a new set of YREC namelist files with user-specified naming convention. 
How to use: 
python update_nml.py [filename].nml1 [filename].nml2 [output_prefix] "[PARAM]=[newvalue]"
- Multiple parameters can be listed after the output prefix. 
'''
import sys
import re

def read_nml(filename):
    with open(filename, "r") as f:
        return f.readlines()

def write_nml(filename, lines):
    with open(filename, "w") as f:
        f.writelines(lines)

def parse_updates(args):
    ''' Reads only valid arguments in CLI, with warning when missing "=" '''
    updates = {}
    for arg in args:
        if "=" not in arg:
            print(f"Skipping invalid update argument: {arg}")
            continue
        param, val = arg.split("=", 1)
        updates[param.strip().upper()] = val.strip()
    return updates

def update_lines(lines, updates):
    """Update lines with new parameter values while keeping indentation and comments."""
    found_params = set()
    new_lines = []

    for line in lines:
        stripped = line.lstrip()
        if not stripped or stripped.startswith("!"):
            new_lines.append(line)
            continue

        updated = False
        for param, val in updates.items():
            # Match param, equal sign, spaces, value, keep all comments
            pattern = rf"^(\s*{re.escape(param)}\s*=\s*)([^\s!]+)"
            match = re.match(pattern, line, re.IGNORECASE)
            if match:
                leading = match.group(1)
                rest_of_line = line[match.end():]
                new_line = f"{leading}{val}{rest_of_line}"
                new_lines.append(new_line)
                found_params.add(param)
                updated = True
                break
        if not updated:
            new_lines.append(line)

    return new_lines, found_params

def main():
    if len(sys.argv) < 5:
        print("Usage: python update_nml.py nml1_file nml2_file output_prefix 'PARAM=VALUE [...]'")
        sys.exit(1)

    nml1_file = sys.argv[1] 
    nml2_file = sys.argv[2]
    output_prefix = sys.argv[3]
    updates = parse_updates(sys.argv[4:])
    
    # Read nml files
    nml1_lines = read_nml(nml1_file)
    nml2_lines = read_nml(nml2_file)

    # Update all parameters in both namelists
    nml1_updated_lines, nml1_found = update_lines(nml1_lines, updates)
    nml2_updated_lines, nml2_found = update_lines(nml2_lines, updates)

    # Warn about missing parameters
    all_found = nml1_found.union(nml2_found)
    missing_params = [param for param in updates if param not in all_found]
    if missing_params:
        print(f"Warning: the following parameters were not found in either .nml1 or .nml2:\n{', '.join(missing_params)}")

    # Rename files using output prefix from CLI
    new_nml1_file = f"{output_prefix}.nml1"
    new_nml2_file = f"{output_prefix}.nml2"
    print(f"Output files:\nnml1: {new_nml1_file}\nnml2: {new_nml2_file}")

    # Save files
    write_nml(new_nml1_file, nml1_updated_lines)
    write_nml(new_nml2_file, nml2_updated_lines)
    print("Files saved successfully.")

if __name__ == "__main__":
    main()