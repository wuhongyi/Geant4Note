<!-- G4IntraNucleiCascader.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 9月  1 11:49:27 2018 (+0800)
;; Last-Updated: 六 9月  1 11:58:38 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4IntraNucleiCascader

**public G4CascadeColliderBase**

```cpp
void collide(G4InuclParticle* bullet, G4InuclParticle* target, G4CollisionOutput& globalOutput);
```

## class

```cpp
public:
  G4IntraNucleiCascader();
  virtual ~G4IntraNucleiCascader();

  void collide(G4InuclParticle* bullet, G4InuclParticle* target,
	       G4CollisionOutput& globalOutput);

  // For use with Propagate to preload a set of secondaries
  void rescatter(G4InuclParticle* bullet, G4KineticTrackVector* theSecondaries,
		 G4V3DNucleus* theNucleus, G4CollisionOutput& globalOutput);

  void setVerboseLevel(G4int verbose=0);

private:
  static const G4int itry_max;		// Maximum number of attempts
  static const G4int reflection_cut;	// Maximum number of reflections
  static const G4double small_ekin;	// Tolerance for round-off zero
  static const G4double quasielast_cut;	// To recover elastic scatters

protected:
  G4bool initialize(G4InuclParticle* bullet, G4InuclParticle* target);

  void newCascade(G4int itry);		// Clear buffers for next attempt
  void setupCascade();			// Fill cascade using nuclear model
  void generateCascade();		// Track secondaries through nucleus
  G4bool finishCascade();		// Clean up output, check consistency

  void finalize(G4int itry, 		// Transfer final state for return
		G4InuclParticle* bullet, G4InuclParticle* target,
		G4CollisionOutput& globalOutput);

  G4InuclParticle* createTarget(G4V3DNucleus* theNucleus);

  // Functions to transfer input high-energy cascade for propagation
  void preloadCascade(G4V3DNucleus* theNucleus,
		      G4KineticTrackVector* theSecondaries);
  void copyWoundedNucleus(G4V3DNucleus* theNucleus);
  void copySecondaries(G4KineticTrackVector* theSecondaries);
  void processSecondary(const G4KineticTrack* aSecondary);
  void releaseSecondary(const G4KineticTrack* aSecondary);

  // Functions to handle, e.g., low-energy hyperons stuck inside potential
  void processTrappedParticle(const G4CascadParticle& trapped);
  void decayTrappedParticle(const G4CascadParticle& trapped);

  // Test if particle is able to interact in nucleus
  G4bool particleCanInteract(const G4CascadParticle& cpart) const;

private: 
  G4NucleiModel* model;
  G4ElementaryParticleCollider* theElementaryParticleCollider;
  G4CascadeRecoilMaker* theRecoilMaker;
  G4CascadeCoalescence* theClusterMaker;
  G4CascadeHistory* theCascadeHistory;

  // Buffers and parameters for cascade attempts
  G4InuclNuclei* tnuclei;		// Target nucleus (must be non-zero)
  G4InuclNuclei* bnuclei;		// Non-zero if ion-ion collision
  G4InuclElementaryParticle* bparticle;	// Non-zero if hadron-ion collision

  G4double minimum_recoil_A;		// Require fragment with this mass
  G4double coulombBarrier;

  // Buffers for creation (and reuse) of rescattering targets
  G4InuclNuclei* nucleusTarget;
  G4InuclElementaryParticle* protonTarget;

  // Buffers for collecting result of cascade (reset on each iteration)
  G4CollisionOutput output;
  std::vector<G4CascadParticle> cascad_particles;
  std::vector<G4CascadParticle> new_cascad_particles;
  G4ExitonConfiguration theExitonConfiguration;

  std::vector<G4ThreeVector> hitNucleons;	// Nucleons hit before rescatter

private:
  // Copying of modules is forbidden
  G4IntraNucleiCascader(const G4IntraNucleiCascader&);
  G4IntraNucleiCascader& operator=(const G4IntraNucleiCascader&);
```

<!-- G4IntraNucleiCascader.md ends here -->
