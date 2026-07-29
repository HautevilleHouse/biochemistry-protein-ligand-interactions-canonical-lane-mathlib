import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiochemistryProteinLigandInteractionsCanonicalLaneLean

structure BindingAssayDependency where
  assayType : String
  requiredReagents : List String
  instrumentation : String
  detectionMethod : String
  dataProcessingSoftware : String

default (D : BindingAssayDependency) : Prop :=
  D.assayType ∈ {"SPR", "ITC", "MST", "fluorescence", "NMR"}

def bindingAssayDependencies : List BindingAssayDependency :=
  [
    { assayType := "SPR", requiredReagents := ["immobilized_protein", "ligand_solution"],
      instrumentation := "Biacore", detectionMethod := "surface plasmon resonance",
      dataProcessingSoftware := "Biacore_Evaluation" },
    { assayType := "ITC", requiredReagents := ["protein_solution", "ligand_solution"],
      instrumentation := "MicroCal PEAQ-ITC", detectionMethod := "heat change",
      dataProcessingSoftware := "Origin" }
  ]

def bindingAssayDependencyCount : Nat := 2

theorem binding_assay_dependency_count_checked :
    bindingAssayDependencies.length = 2 := by
  rfl

end BiochemistryProteinLigandInteractionsCanonicalLaneLean
end HautevilleHouse