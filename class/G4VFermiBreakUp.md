<!-- G4VFermiBreakUp.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 9月  1 13:25:07 2018 (+0800)
;; Last-Updated: 六 9月  1 13:25:42 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4VFermiBreakUp

Hadronic Process: Nuclear De-excitations

## class

```cpp
public:

  explicit G4VFermiBreakUp() {};
  virtual ~G4VFermiBreakUp() {};

  virtual void Initialise() = 0;

  // check if the Fermi Break Up model can be used 
  // mass is an effective mass of a fragment
  virtual G4bool IsApplicable(G4int Z, G4int A, G4double mass) const = 0;

  // vector of products is added to the provided vector
  // if no decay channel is found out for the primary fragment 
  // then it is added to the results vector
  // if primary decays then it is deleted 
  virtual void BreakFragment(G4FragmentVector* results, 
			     G4Fragment* theNucleus) = 0;

private:

  G4VFermiBreakUp(const G4VFermiBreakUp &right) = delete;  
  const G4VFermiBreakUp & operator=(const G4VFermiBreakUp &right) = delete;
  G4bool operator==(const G4VFermiBreakUp &right) const = delete;
  G4bool operator!=(const G4VFermiBreakUp &right) const = delete;
```

<!-- G4VFermiBreakUp.md ends here -->
