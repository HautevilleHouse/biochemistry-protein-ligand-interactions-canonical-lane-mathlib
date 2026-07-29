import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiochemistryProteinLigandInteractionsCanonicalLaneLean

structure LigandThermodynamicsPackage where
  bindingFreeEnergy : ℝ
  enthalpyChange : ℝ
  entropyChange : ℝ
  heatCapacity : ℝ
  temperature : ℝ

default (G : LigandThermodynamicsPackage) : Prop :=
  G.bindingFreeEnergy = G.enthalpyChange - G.temperature * G.entropyChange

structure LigandThermodynamicsEvidence (T : LigandThermodynamicsPackage) where
  bindingFreeEnergyClosed : T.bindingFreeEnergy < 0
  enthalpyChangeClosed : T.enthalpyChange ∈ ℝ
  entropyChangeClosed : T.entropyChange ∈ ℝ
  heatCapacityClosed : T.heatCapacity > 0
  temperatureClosed : T.temperature > 0
  gibbsEquationClosed : T.bindingFreeEnergy = T.enthalpyChange - T.temperature * T.entropyChange

def LigandThermodynamicsClosed (T : LigandThermodynamicsPackage) : Prop :=
  T.bindingFreeEnergy < 0 ∧
  T.bindingFreeEnergy = T.enthalpyChange - T.temperature * T.entropyChange ∧
  T.heatCapacity > 0 ∧
  T.temperature > 0

theorem ligand_thermodynamics_closed_from_evidence (T : LigandThermodynamicsPackage) (E : LigandThermodynamicsEvidence T) :
    LigandThermodynamicsClosed T := by
  exact And.intro E.bindingFreeEnergyClosed
    (And.intro E.gibbsEquationClosed
      (And.intro E.heatCapacityClosed E.temperatureClosed))

end BiochemistryProteinLigandInteractionsCanonicalLaneLean
end HautevilleHouse
