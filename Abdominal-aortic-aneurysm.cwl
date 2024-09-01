cwlVersion: v1.0
steps:
  read-potential-cases-fhir:
    run: read-potential-cases-fhir.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  renal-abdominal-aortic-aneurysm---secondary:
    run: renal-abdominal-aortic-aneurysm---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-fhir/output
  occlusive-abdominal-aortic-aneurysm---secondary:
    run: occlusive-abdominal-aortic-aneurysm---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: renal-abdominal-aortic-aneurysm---secondary/output
  abdominal-aortic-aneurysm-ruptured---secondary:
    run: abdominal-aortic-aneurysm-ruptured---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: occlusive-abdominal-aortic-aneurysm---secondary/output
  external-abdominal-aortic-aneurysm---secondary:
    run: external-abdominal-aortic-aneurysm---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: abdominal-aortic-aneurysm-ruptured---secondary/output
  abdominal-aortic-aneurysm-artery---secondary:
    run: abdominal-aortic-aneurysm-artery---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: external-abdominal-aortic-aneurysm---secondary/output
  abdominal-aortic-aneurysm---icduncat:
    run: abdominal-aortic-aneurysm---icduncat.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: abdominal-aortic-aneurysm-artery---secondary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: abdominal-aortic-aneurysm---icduncat/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
