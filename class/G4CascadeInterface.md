<!-- G4CascadeInterface.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 五 8月 10 07:14:43 2018 (+0800)
;; Last-Updated: 六 9月  1 11:15:40 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 3
;; URL: http://wuhongyi.cn -->

# G4CascadeInterface

**public G4VIntraNuclearTransportModel**

Defines an interface to Bertini (BERT) cascade based on INUCL  intra-nuclear transport.models with bullet hadron energy ~< 10 GeV

```cpp
  G4HadFinalState* ApplyYourself(const G4HadProjectile& aTrack, G4Nucleus& theNucleus);

// 弹靶对撞
G4InuclCollider
G4CascadeCheckBalance
```


## class

```cpp
public:
  G4CascadeInterface(const G4String& name = "BertiniCascade");

  virtual ~G4CascadeInterface();

  G4ReactionProductVector* Propagate(G4KineticTrackVector* theSecondaries,
				     G4V3DNucleus* theNucleus);
  
  G4HadFinalState* ApplyYourself(const G4HadProjectile& aTrack,
				 G4Nucleus& theNucleus);

  void SetVerboseLevel(G4int verbose);		// Overrides base class

  G4bool IsApplicable(const G4HadProjectile& aTrack,
		      G4Nucleus& theNucleus);

  G4bool IsApplicable(const G4ParticleDefinition* aPD) const;

  // Used with multithreaded applications to preload shared objects
  static void Initialize();

  // Select betweeen different post-cascade de-excitation models
  void useCascadeDeexcitation();
  void usePreCompoundDeexcitation();

  virtual void ModelDescription(std::ostream& outFile) const;
  virtual void DumpConfiguration(std::ostream& outFile) const;

protected:
  void clear();			// Delete previously created particles

  // Convert input projectile and target to Bertini internal types
  G4bool createBullet(const G4HadProjectile& aTrack);
  G4bool createTarget(G4Nucleus& theNucleus);
  G4bool createTarget(G4V3DNucleus* theNucleus);
  G4bool createTarget(G4int A, G4int Z);

  // Evaluate whether any outgoing particles penetrated Coulomb barrier
  G4bool coulombBarrierViolation() const;

  // Conditions for rejecting cascade attempt
  G4bool retryInelasticProton() const;
  G4bool retryInelasticNucleus() const;

  // Transfer Bertini internal final state to hadronics interface
  void copyOutputToHadronicResult();
  G4ReactionProductVector* copyOutputToReactionProducts();

  // Replicate input particles onto output
  G4HadFinalState* NoInteraction(const G4HadProjectile& aTrack,
				 G4Nucleus& theNucleus);

  // Report violations of conservation laws in original frame
  void checkFinalResult();

  // Terminate job because of energy/momentum/etc. violations
  void throwNonConservationFailure();

  // Convert between Bertini and external particle types
  G4DynamicParticle* makeDynamicParticle(const G4InuclElementaryParticle& iep) const;
  G4DynamicParticle* makeDynamicParticle(const G4InuclNuclei& inuc) const;


private:
  G4int operator==(const G4CascadeInterface& right) const {
    return (this == &right);
  }

  G4int operator!=(const G4CascadeInterface& right) const {
    return (this != &right);
  }

  const G4String randomFile;		// Filename to capture random seeds
  const G4int maximumTries;		// Number of iterations for inelastic

  G4int numberOfTries;

  G4InuclCollider* collider;
  G4CascadeCheckBalance* balance;

  G4InuclParticle* bullet;		// Pointers to last filled versions
  G4InuclParticle* target;

  G4CollisionOutput* output;

  G4InuclElementaryParticle hadronBullet;	// Buffers for bullet, target
  G4InuclNuclei             nucleusBullet;

  G4InuclElementaryParticle hadronTarget;
  G4InuclNuclei             nucleusTarget;
```

<!-- G4CascadeInterface.md ends here -->
