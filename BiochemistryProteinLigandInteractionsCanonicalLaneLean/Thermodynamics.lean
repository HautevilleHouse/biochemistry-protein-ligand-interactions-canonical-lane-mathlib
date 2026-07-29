import HautevilleHouse.BiochemistryProteinLigandInteractionsCanonicalLaneLean.BindingKinetics

namespace HautevilleHouse
namespace BiochemistryProteinLigandInteractionsCanonicalLaneLean

structure ThermodynamicsPackage {B : BindingKineticsPackage} where
  gibbsFreeEnergy : Prop
  enthalpy : Prop
  entropy : Prop
  vantHoffConsistency : Prop

structure ThermodynamicsEvidence {B : BindingKineticsPackage} (T : ThermodynamicsPackage B) where
  gibbsFreeEnergyClosed : T.gibbsFreeEnergy
  enthalpyClosed : T.enthalpy
  entropyClosed : T.entropy
  vantHoffConsistencyClosed : T.vantHoffConsistency

def ThermodynamicsClosed {B : BindingKineticsPackage} (T : ThermodynamicsPackage B) : Prop :=
  T.gibbsFreeEnergy ∧ T.enthalpy ∧ T.entropy ∧ T.vantHoffConsistency

theorem thermodynamics_closed_from_evidence {B : BindingKineticsPackage} (T : ThermodynamicsPackage B) (E : ThermodynamicsEvidence T) : ThermodynamicsClosed T := by
  exact And.intro E.gibbsFreeEnergyClosed
    (And.intro E.enthalpyClosed
      (And.intro E.entropyClosed E.vantHoffConsistencyClosed))

end BiochemistryProteinLigandInteractionsCanonicalLaneLean
end HautevilleHouse