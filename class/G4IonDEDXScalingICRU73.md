<!-- G4IonDEDXScalingICRU73.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 7月 14 08:13:46 2018 (+0800)
;; Last-Updated: 六 7月 14 08:15:21 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4IonDEDXScalingICRU73

**public G4VIonDEDXScalingAlgorithm**

dE/dx scaling algorithm applied on top of ICRU 73 data (for ions not covered by the ICRU 73 report) 

## class

```cpp
 public:
   G4IonDEDXScalingICRU73(G4int minAtomicNumberIon = 19,
                          G4int maxAtomicNumberIon = 102);
   ~G4IonDEDXScalingICRU73();

   // Function for scaling the kinetic energy (no scaling by default).
   // Returns scaling factor for a given ion.
   G4double ScalingFactorEnergy(
             const G4ParticleDefinition* particle,     // Projectile (ion) 
             const G4Material* material);              // Target material
                                                         

   // Function for scaling the dE/dx value (no scaling by default).
   // Returns scaling factor for a given ion-material couple and
   // a given kinetic energy.
   G4double ScalingFactorDEDX(
             const G4ParticleDefinition* particle,     // Projectile (ion) 
             const G4Material*,                        // Target material
             G4double kineticEnergy);                  // Kinetic energy


   // Function for defining a base particle for dE/dx calculation.
   // (no base particle by default). Returns atomic number of base
   // particle.
   G4int AtomicNumberBaseIon(
             G4int atomicNumberIon,           // Atomic number of ion 
             const G4Material*);              // Target material

 private:
   void UpdateCacheParticle(
             const G4ParticleDefinition* particle);    // Projectile (ion) 

   void UpdateCacheMaterial(
             const G4Material* material);              // Target material 

   void CreateReferenceParticles();
 
   G4double EquilibriumCharge(
             G4double mass,                            // Ion mass
             G4double charge,                          // Ion charge
             G4double atomicNumberPow,                 // Power of atomic nmb  
             G4double kineticEnergy);                  // Kinetic energy
```


<!-- G4IonDEDXScalingICRU73.md ends here -->
