import json


class Notebook(object):
    INPUT = u'input'
    OUTPUTS = u'outputs'
    CELL_TYPE = 'cell_type'

    def __init__(self, fh):
        self.data = json.load(fh)
    
    def __iter__(self):
        for worksheet in self.data['worksheets']:
            for cell in worksheet['cells']:
                yield cell

    def clear_code(self, keyword='# Solution:'):
        for cell in self:
            if cell[self.CELL_TYPE] == 'code' and cell[self.INPUT] and cell[self.INPUT][0].startswith(keyword):
                cell[self.CODE_CELL] = []
                cell[self.OUTPUTS] = []

    def clear_output(self):
        for cell in self:
            if cell[self.CELL_TYPE] == 'code':
                cell.pop('prompt_number', None)
                cell[self.OUTPUTS] = []

    def save(self, fh):
        json.dump(self.data, fh, indent=4)


if __name__ == '__main__':
    import sys
    notebook = sys.argv[1]
    if len(sys.argv) > 1:
        output = sys.argv[2]
    else:
        output = notebook

    with open(notebook) as fh:
        nb = Notebook(fh)

    if '--clear-output' in sys.argv:
        nb.clear_output()
    
    if '--clear-code' in sys.argv:
        nb.clear_code()

    with open(output, 'w') as fh:
        nb.save(fh)        
