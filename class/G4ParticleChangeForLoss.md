<!-- G4ParticleChangeForLoss.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 7月 14 11:57:30 2018 (+0800)
;; Last-Updated: 六 7月 14 11:58:39 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4ParticleChangeForLoss

**public G4VParticleChange**

This class is a concrete class for ParticleChange for EnergyLoss

## class


```cpp
public:
  // default constructor
  G4ParticleChangeForLoss();

  // destructor
  virtual ~G4ParticleChangeForLoss();

  // with description
  // ----------------------------------------------------
  // --- the following methods are for updating G4Step -----

  G4Step* UpdateStepForAlongStep(G4Step* Step);
  G4Step* UpdateStepForPostStep(G4Step* Step);
  // A physics process gives the final state of the particle
  // based on information of G4Track

  void InitializeForAlongStep(const G4Track&);
  void InitializeForPostStep(const G4Track&);
  //Initialize all propoerties by using G4Track information

  //  void AddSecondary(G4DynamicParticle* aParticle);
  // Add next secondary

  inline G4double GetProposedCharge() const;
  inline void SetProposedCharge(G4double theCharge);
  //   Get/Set theCharge

  inline G4double GetCharge() const;
  inline void ProposeCharge(G4double finalCharge);
  //   Get/Propose the final dynamical Charge in G4DynamicParticle

  inline G4double GetProposedKineticEnergy() const;
  inline void SetProposedKineticEnergy(G4double proposedKinEnergy);
  // Get/Set the final kinetic energy of the current particle.

  inline const G4ThreeVector& GetProposedMomentumDirection() const;
  inline void SetProposedMomentumDirection(const G4ThreeVector& dir);
  inline const G4ThreeVector& GetMomentumDirection() const;
  inline void ProposeMomentumDirection(G4double Px, G4double Py, G4double Pz);
  inline void ProposeMomentumDirection(const G4ThreeVector& Pfinal);
  // Get/Propose the MomentumDirection vector: it is the final momentum direction.

  inline const G4ThreeVector& GetProposedPolarization() const;
  inline void ProposePolarization(const G4ThreeVector& dir);
  inline void ProposePolarization(G4double Px, G4double Py, G4double Pz);

  inline const G4Track* GetCurrentTrack() const;

  inline void SetLowEnergyLimit(G4double elimit);

  virtual void DumpInfo() const;

  // for Debug
  virtual G4bool CheckIt(const G4Track&);

protected:
  // hide copy constructor and assignment operaor as protected
  G4ParticleChangeForLoss(const G4ParticleChangeForLoss &right);
  G4ParticleChangeForLoss & operator=(const G4ParticleChangeForLoss &right);
```

<!-- G4ParticleChangeForLoss.md ends here -->
