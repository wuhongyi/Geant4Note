<!-- G4ElementaryParticleCollider.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 9月  1 11:35:31 2018 (+0800)
;; Last-Updated: 六 9月  1 11:38:01 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4ElementaryParticleCollider

**public G4CascadeColliderBase**

```cpp
  void collide(G4InuclParticle* bullet, G4InuclParticle* target, G4CollisionOutput& output);
```



## class

```cpp
public:
  G4ElementaryParticleCollider();
  virtual ~G4ElementaryParticleCollider() {};
  
  void collide(G4InuclParticle* bullet, G4InuclParticle* target,
	       G4CollisionOutput& output);

  void setNucleusState(G4int a, G4int z) {	// Nucleus to use for recoil
    nucleusA = a; nucleusZ = z;
  }

private:
  G4int generateMultiplicity(G4int is, G4double ekin) const;

  void generateOutgoingPartTypes(G4int is, G4int mult, G4double ekin);

  void generateSCMfinalState(G4double ekin, G4double etot_scm,
			     G4InuclElementaryParticle* particle1,
			     G4InuclElementaryParticle* particle2); 

  // Pion (or photon) absorption on a dibaryon
  void generateSCMpionAbsorption(G4double etot_scm,
				 G4InuclElementaryParticle* particle1,
				 G4InuclElementaryParticle* particle2); 

  // Muon absorption on a dibaryon (with outgoing neutrino)
  void generateSCMmuonAbsorption(G4double etot_scm,
				 G4InuclElementaryParticle* particle1,
				 G4InuclElementaryParticle* particle2); 

  // Pion absorption on a single nucleon (charge exchange)
  void generateSCMpionNAbsorption(G4double etot_scm,
				  G4InuclElementaryParticle* particle1,
				  G4InuclElementaryParticle* particle2); 

  G4bool pionNucleonAbsorption(G4double ekin) const;

  G4bool splitQuasiDeuteron(G4int qdtype); 	// Fill kinds with NN components

  void fillOutgoingMasses();		// Fill mass arrays from particle types

  // Utility class to generate final-state kinematics
  G4CascadeFinalStateGenerator fsGenerator;

  // Internal buffers for lists of secondaries
  std::vector<G4InuclElementaryParticle> particles;
  std::vector<G4LorentzVector> scm_momentums;
  std::vector<G4double> modules;
  std::vector<G4double> masses;
  std::vector<G4double> masses2;
  std::vector<G4int> particle_kinds;

  // Nuclear environment (to do pion-nucleon absorption)
  G4int nucleusA, nucleusZ;

private:
  // Copying of modules is forbidden
  G4ElementaryParticleCollider(const G4ElementaryParticleCollider&);
  G4ElementaryParticleCollider& operator=(const G4ElementaryParticleCollider&);
```

<!-- G4ElementaryParticleCollider.md ends here -->
