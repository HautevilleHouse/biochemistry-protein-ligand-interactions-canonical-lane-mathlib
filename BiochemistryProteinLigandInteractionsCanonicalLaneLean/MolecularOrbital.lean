import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiochemistryProteinLigandInteractionsCanonicalLaneLean

structure MolecularOrbitalPackage where
  orbitalEnergies : List ℝ
  linearCombination : ℕ → ℝ
  overlapIntegrals : ℝ → ℝ → Prop
  huckelApproximation : Prop
  symmetryConstraints : Prop

structure MolecularOrbitalEvidence (M : MolecularOrbitalPackage) where
  orbitalEnergiesClosed : ∀ ε ∈ M.orbitalEnergies, ε ≤ 0
  linearCombinationClosed : M.linearCombination 0 > 0
  overlapIntegralsClosed : M.overlapIntegrals 0 1
  huckelApproximationClosed : M.huckelApproximation
  symmetryConstraintsClosed : M.symmetryConstraints

def MolecularOrbitalClosed (M : MolecularOrbitalPackage) : Prop :=
  (∀ ε ∈ M.orbitalEnergies, ε ≤ 0) ∧ M.linearCombination 0 > 0 ∧
  M.overlapIntegrals 0 1 ∧ M.huckelApproximation ∧ M.symmetryConstraints

theorem molecular_orbital_closed_from_evidence (M : MolecularOrbitalPackage) (E : MolecularOrbitalEvidence M) :
  MolecularOrbitalClosed M :=
by
  exact And.intro E.orbitalEnergiesClosed
    (And.intro E.linearCombinationClosed
      (And.intro E.overlapIntegralsClosed
        (And.intro E.huckelApproximationClosed E.symmetryConstraintsClosed)))

end BiochemistryProteinLigandInteractionsCanonicalLaneLean
end HautevilleHouse