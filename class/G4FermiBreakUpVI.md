<!-- G4FermiBreakUpVI.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 9月  1 13:26:21 2018 (+0800)
;; Last-Updated: 六 9月  1 13:28:04 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4FermiBreakUpVI

**public G4VFermiBreakUp**


## class

```cpp
public:

  explicit G4FermiBreakUpVI();
  virtual ~G4FermiBreakUpVI();

  virtual void Initialise() final;

  // check if the Fermi Break Up model can be used 
  // mass is an effective mass of a fragment
  virtual G4bool IsApplicable(G4int ZZ, G4int AA, G4double etot) const final;

  // new interface - vector of products is added to the provided vector
  // primary fragment is deleted or is modified and added to the list
  // of products 
  virtual void BreakFragment(G4FragmentVector*, G4Fragment* theNucleus) final;
  
private:

  virtual void InitialisePool() final;

  G4bool SampleDecay();

  G4FermiBreakUpVI(const G4FermiBreakUpVI &right) = delete;  
  const G4FermiBreakUpVI & operator=(const G4FermiBreakUpVI &right) = delete;
  G4bool operator==(const G4FermiBreakUpVI &right) const = delete;
  G4bool operator!=(const G4FermiBreakUpVI &right) const = delete;

  static G4FermiFragmentsPoolVI* thePool;
  const  G4FermiDecayProbability* theDecay;

  CLHEP::HepRandomEngine* rndmEngine;

  G4int verbose;
  G4int maxZ;
  G4int maxA;

  G4int Z;
  G4int A;
  G4int spin;

  G4double mass;
  G4double excitation;
  G4double tolerance;
  G4double elim;

  const G4FermiFragment* frag1;
  const G4FermiFragment* frag2;

  G4LorentzVector lv0;
  G4ThreeVector boostVector;

  std::vector<G4double> prob;
  std::vector<const G4FermiFragment*> frag;
  std::vector<G4LorentzVector> lvect;

#ifdef G4MULTITHREADED
  static G4Mutex FermiBreakUpVIMutex;
#endif
```

<!-- G4FermiBreakUpVI.md ends here -->
