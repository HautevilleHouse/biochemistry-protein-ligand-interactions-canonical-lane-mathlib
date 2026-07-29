import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiochemistryProteinLigandInteractionsCanonicalLaneLean

structure ProteinLigandAdmittedObject where
  bindingAffinity : Prop
  kineticsData : Prop
  thermodynamicData : Prop
  conclusion : bindingAffinity ∧ kineticsData ∧ thermodynamicData

structure AdmissibleClass where
  object : ProteinLigandAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  (A.object.conclusion) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BiochemistryProteinLigandInteractionsCanonicalLaneLean
end HautevilleHouse