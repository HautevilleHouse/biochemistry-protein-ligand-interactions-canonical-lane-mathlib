import BiochemistryProteinLigandInteractionsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BiochemistryProteinLigandInteractionsCanonicalLaneLean

structure BindingKineticsPackage where
  associationRate : ℝ
  dissociationRate : ℝ
  equilibriumConstant : ℝ
  kineticsClosed : Prop

structure BindingKineticsEvidence (K : BindingKineticsPackage) where
  associationRatePositive : K.associationRate > 0
  dissociationRatePositive : K.dissociationRate > 0
  equilibriumRateDerived : K.equilibriumConstant = K.associationRate / K.dissociationRate

def BindingKineticsClosed (K : BindingKineticsPackage) : Prop :=
  K.kineticsClosed

theorem binding_kinetics_closed_from_evidence (K : BindingKineticsPackage)
    (E : BindingKineticsEvidence K) : BindingKineticsClosed K := by
  exact E.equilibriumRateDerived

end BiochemistryProteinLigandInteractionsCanonicalLaneLean
end HautevilleHouse