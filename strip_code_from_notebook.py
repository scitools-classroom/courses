import json
import sys

empty_code_cell = {u'cell_type': u'code', u'language': u'python',
                   u'outputs': [], u'collapsed': False, u'input': [], u'metadata': {}}

notebook = sys.argv[1]
output = sys.argv[2]

with open(notebook) as fh:
    data = json.load(fh)
    for worksheet in data['worksheets']:
        for cell in worksheet['cells']:
            if cell['cell_type'] == 'code':
                cell.update(empty_code_cell)

with open(output, 'w') as fh:
    json.dump(data, fh)
