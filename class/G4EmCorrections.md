<!-- G4EmCorrections.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 五 7月 13 04:14:35 2018 (+0800)
;; Last-Updated: 六 7月 14 02:52:41 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 3
;; URL: http://wuhongyi.cn -->

# G4EmCorrections

This class provides calculation of EM corrections to ionisation

## class

```cpp
public:

  explicit G4EmCorrections(G4int verb);

  virtual ~G4EmCorrections();

  G4double HighOrderCorrections(const G4ParticleDefinition*,
                                const G4Material*,
                                G4double kineticEnergy,
                                G4double cutEnergy);

  G4double IonHighOrderCorrections(const G4ParticleDefinition*,
                                   const G4MaterialCutsCouple*,
                                   G4double kineticEnergy);

  G4double ComputeIonCorrections(const G4ParticleDefinition*,
                                 const G4Material*,
                                 G4double kineticEnergy);

  G4double IonBarkasCorrection(const G4ParticleDefinition*,
                               const G4Material*,
                               G4double kineticEnergy);

  G4double Bethe(const G4ParticleDefinition*,
                 const G4Material*,
                 G4double kineticEnergy);

  G4double SpinCorrection(const G4ParticleDefinition*,
                          const G4Material*,
                          G4double kineticEnergy);

  G4double KShellCorrection(const G4ParticleDefinition*,
                            const G4Material*,
                            G4double kineticEnergy);

  G4double LShellCorrection(const G4ParticleDefinition*,
                            const G4Material*,
                            G4double kineticEnergy);

  G4double ShellCorrection(const G4ParticleDefinition*,
                           const G4Material*,
                           G4double kineticEnergy);

  G4double ShellCorrectionSTD(const G4ParticleDefinition*,
                              const G4Material*,
                              G4double kineticEnergy);

  G4double DensityCorrection(const G4ParticleDefinition*,
                             const G4Material*,
                             G4double kineticEnergy);

  G4double BarkasCorrection(const G4ParticleDefinition*,
                            const G4Material*,
                            G4double kineticEnergy);

  G4double BlochCorrection(const G4ParticleDefinition*,
                           const G4Material*,
                           G4double kineticEnergy);

  G4double MottCorrection(const G4ParticleDefinition*,
                          const G4Material*,
                          G4double kineticEnergy);

  void AddStoppingData(G4int Z, G4int A, const G4String& materialName,
                       G4PhysicsVector* dVector);

  void InitialiseForNewRun();

  // effective charge correction using stopping power data
  G4double EffectiveChargeCorrection(const G4ParticleDefinition*,
                                     const G4Material*,
                                     G4double kineticEnergy);

  // effective charge of an ion
  inline G4double GetParticleCharge(const G4ParticleDefinition*,
                                    const G4Material*,
                                    G4double kineticEnergy);

  inline
  G4double EffectiveChargeSquareRatio(const G4ParticleDefinition*,
                                      const G4Material*,
                                      G4double kineticEnergy);

  // ionisation models for ions
  inline void SetIonisationModels(G4VEmModel* m1 = nullptr, 
                                  G4VEmModel* m2 = nullptr);

  inline G4int GetNumberOfStoppingVectors() const;

  inline void SetVerbose(G4int verb);

private:

  void Initialise();

  void BuildCorrectionVector();

  void SetupKinematics(const G4ParticleDefinition*,
                       const G4Material*,
                       G4double kineticEnergy);

  G4double KShell(G4double theta, G4double eta);

  G4double LShell(G4double theta, G4double eta);

  G4int Index(G4double x, const G4double* y, G4int n) const;

  G4double Value(G4double xv, G4double x1, G4double x2, 
                 G4double y1, G4double y2) const;

  G4double Value2(G4double xv, G4double yv, G4double x1, G4double x2,
                  G4double y1, G4double y2, G4double z11, G4double z21, 
		  G4double z12, G4double z22) const;

  // hide assignment operator
  G4EmCorrections & operator=(const G4EmCorrections &right) = delete;
  G4EmCorrections(const G4EmCorrections&) = delete;
```


<!-- G4EmCorrections.md ends here -->
