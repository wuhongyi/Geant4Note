<!-- G4VIonDEDXScalingAlgorithm.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 7月 14 08:11:07 2018 (+0800)
;; Last-Updated: 六 7月 14 08:12:27 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 3
;; URL: http://wuhongyi.cn -->

# G4VIonDEDXScalingAlgorithm

Base class for dE/dx scaling algorithms, used by G4IonDEDXHandler

## class

```cpp
 public:
   G4VIonDEDXScalingAlgorithm();
   virtual ~G4VIonDEDXScalingAlgorithm();

   // Function for scaling the kinetic energy (no scaling by default).
   // Returns scaling factor for a given ion.
   virtual G4double ScalingFactorEnergy(
             const G4ParticleDefinition*,     // Projectile (ion) 
             const G4Material*)               // Target material
                 { return 1.0; }

   // Function for scaling the dE/dx value (no scaling by default).
   // Returns scaling factor for a given ion-material couple and
   // a given kinetic energy.
   virtual G4double ScalingFactorDEDX(
             const G4ParticleDefinition*,     // Projectile (ion) 
             const G4Material*,               // Target material
             G4double)                        // Kinetic energy of projectile 
                 { return 1.0; }

   // Function for defining a base particle for dE/dx calculation.
   // (no base particle by default). Returns atomic number of base
   // particle.
   virtual G4int AtomicNumberBaseIon(
             G4int atomicNumberIon,           // Atomic number of ion 
             const G4Material*)               // Target material
                 { return atomicNumberIon; }
```




<!-- G4VIonDEDXScalingAlgorithm.md ends here -->
