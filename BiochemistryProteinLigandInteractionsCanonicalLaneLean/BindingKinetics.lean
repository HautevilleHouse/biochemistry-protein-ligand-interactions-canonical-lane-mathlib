import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiochemistryProteinLigandInteractionsCanonicalLaneLean

structure BindingKineticsPackage where
  bindingRate : Prop
  dissociationRate : Prop
  equilibriumConstant : Prop
  michaelisMentenConstant : Prop
  maxVelocity : Prop
  substrateConcentration : Prop

structure BindingKineticsEvidence (B : BindingKineticsPackage) where
  bindingRateClosed : B.bindingRate
  dissociationRateClosed : B.dissociationRate
  equilibriumConstantClosed : B.equilibriumConstant
  michaelisMentenConstantClosed : B.michaelisMentenConstant
  maxVelocityClosed : B.maxVelocity
  substrateConcentrationClosed : B.substrateConcentration

def BindingKineticsClosed (B : BindingKineticsPackage) : Prop :=
  B.bindingRate ∧ B.dissociationRate ∧ B.equilibriumConstant ∧
  B.michaelisMentenConstant ∧ B.maxVelocity ∧ B.substrateConcentration

theorem binding_kinetics_closed_from_evidence (B : BindingKineticsPackage)
    (E : BindingKineticsEvidence B) : BindingKineticsClosed B :=
  And.intro E.bindingRateClosed (And.intro E.dissociationRateClosed
    (And.intro E.equilibriumConstantClosed (And.intro E.michaelisMentenConstantClosed
      (And.intro E.maxVelocityClosed E.substrateConcentrationClosed))))

end BiochemistryProteinLigandInteractionsCanonicalLaneLean
end HautevilleHouse