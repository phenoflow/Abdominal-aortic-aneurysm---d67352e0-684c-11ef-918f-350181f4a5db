# phekb, 2024.

import sys, csv, re

codes = [{"code":"34800","system":" CPT"},{"code":"34802","system":" CPT"},{"code":"34803","system":" CPT"},{"code":"34804","system":" CPT"},{"code":"34805","system":" CPT"},{"code":"34830","system":" CPT"},{"code":"34831","system":" CPT"},{"code":"34832","system":" CPT"},{"code":"35091","system":" CPT"},{"code":"35092","system":" CPT"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('abdominal-aortic-aneurysm-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["renal-abdominal-aortic-aneurysm---secondary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["renal-abdominal-aortic-aneurysm---secondary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["renal-abdominal-aortic-aneurysm---secondary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
