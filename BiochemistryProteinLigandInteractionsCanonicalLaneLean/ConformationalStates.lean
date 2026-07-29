import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiochemistryProteinLigandInteractionsCanonicalLaneLean

structure ConformationalStatesPackage where
  proteinConformers : List Type
  ligandConformers : List Type
  boundState : Type
  unboundState : Type
  transitionRates : ℝ

default (C : ConformationalStatesPackage) : Prop :=
  C.transitionRates > 0

structure ConformationalStatesEvidence (C : ConformationalStatesPackage) where
  proteinConformersClosed : C.proteinConformers ≠ []
  ligandConformersClosed : C.ligandConformers ≠ []
  boundStateClosed : C.boundState ∈ C.proteinConformers × C.ligandConformers
  unboundStateClosed : C.unboundState ∉ C.proteinConformers × C.ligandConformers
  transitionRatesClosed : C.transitionRates > 0

def ConformationalStatesClosed (C : ConformationalStatesPackage) : Prop :=
  C.proteinConformers ≠ [] ∧
  C.ligandConformers ≠ [] ∧
  C.boundState ∈ C.proteinConformers × C.ligandConformers ∧
  C.unboundState ∉ C.proteinConformers × C.ligandConformers ∧
  C.transitionRates > 0

theorem conformational_states_closed_from_evidence (C : ConformationalStatesPackage) (E : ConformationalStatesEvidence C) :
    ConformationalStatesClosed C := by
  exact And.intro E.proteinConformersClosed
    (And.intro E.ligandConformersClosed
      (And.intro E.boundStateClosed
        (And.intro E.unboundStateClosed E.transitionRatesClosed)))

end BiochemistryProteinLigandInteractionsCanonicalLaneLean
end HautevilleHouse
