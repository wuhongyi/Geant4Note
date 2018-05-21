<!-- OpticalPhoton.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 12月 23 22:19:52 2017 (+0800)
;; Last-Updated: 一 5月 21 08:43:27 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 5
;; URL: http://wuhongyi.cn -->

# OpticalPhoton

> http://geant4-userdoc.web.cern.ch/geant4-userdoc/UsersGuides/ForApplicationDeveloper/html/TrackingAndPhysics/physicsProcess.html#optical-photon-processes


A photon is considered to be optical when its wavelength is much greater than the typical atomic spacing. In Geant4 optical photons are treated as a class of particle distinct from their higher energy gamma cousins. This implementation allows the wave-like properties of electromagnetic radiation to be incorporated into the optical photon process. Because this theoretical description breaks down at higher energies, there is no smooth transition as a function of energy between the optical photon and gamma particle classes.

For the simulation of optical photons to work correctly in Geant4, they must be imputed a linear polarization. This is unlike most other particles in Geant4 but is automatically and correctly done for optical photons that are generated as secondaries by existing processes in Geant4. Not so, if the user wishes to start optical photons as primary particles. In this case, the user must set the linear polarization using particle gun methods, the General Particle Source, or his/her PrimaryGeneratorAction. For an unpolarized source, the linear polarization should be sampled randomly for each new primary photon.

**The Geant4 catalogue of processes at optical wavelengths includes refraction and reflection at medium boundaries, bulk absorption, Mie and Rayleigh scattering.** Processes which produce optical photons include the Cerenkov effect and scintillation. Optical photons are generated in Geant4 without energy conservation and their energy must therefore not be tallied as part of the energy balance of an event.

The optical properties of the medium which are key to the implementation of these types of processes are stored as entries in a G4MaterialPropertiesTable which is linked to the G4Material in question. These properties may be constants or they may be expressed as a function of the photon’s energy. This table is a private data member of the G4Material class. The G4MaterialPropertiesTable is implemented as a hash directory, in which each entry consists of a value and a key. The key is used to quickly and efficiently retrieve the corresponding value. All values in the dictionary are either instantiations of G4double or the class G4MaterialPropertyVector, and all keys are of type G4String.

A **G4MaterialPropertyVector** is a typedef of **G4PhysicsOrderedFreeVector**. The entries are a pair of numbers, which in the case of an optical property, are the photon energy and corresponding property value. It is possible for the user to add as many material (optical) properties to the material as he wishes using the methods supplied by the **G4MaterialPropertiesTable** class. In this example the interpolation of the **G4MaterialPropertyVector** is to be done by a spline fit. The default is a linear interpolation.


```cpp
// Optical properties added to a G4MaterialPropertiesTable and linked to a G4Material
const G4int NUMENTRIES = 32;

G4double ppckov[NUMENTRIES] = {2.034*eV, ......, 4.136*eV};
G4double rindex[NUMENTRIES] = {1.3435, ......, 1.3608};
G4double absorption[NUMENTRIES] = {344.8*cm, ......, 1450.0*cm];

G4MaterialPropertiesTable* MPT = new G4MaterialPropertiesTable();

MPT -> AddConstProperty("SCINTILLATIONYIELD",100./MeV);

MPT -> AddProperty("RINDEX",ppckov,rindex,NUMENTRIES}->SetSpline(true);
MPT -> AddProperty("ABSLENGTH",ppckov,absorption,NUMENTRIES}->SetSpline(true);

scintillator -> SetMaterialPropertiesTable(MPT);
```

## Cerenkov Effect

The radiation of Cerenkov light occurs when a charged particle moves through a dispersive medium faster than the group velocity of light in that medium. Photons are emitted on the surface of a cone, whose opening angle with respect to the particle’s instantaneous direction decreases as the particle slows down. At the same time, the frequency of the photons emitted increases, and the number produced decreases. When the particle velocity drops below the local speed of light, the radiation ceases and the emission cone angle collapses to zero. The photons produced by this process have an inherent polarization perpendicular to the cone’s surface at production.

The flux, spectrum, polarization and emission of Cerenkov radiation in the **AlongStepDoIt** method of the class **G4Cerenkov** follow well-known formulae, with two inherent computational limitations. The first arises from step-wise simulation, and the second comes from the requirement that numerical integration calculate the average number of Cerenkov photons per step. The process makes use of a **G4PhysicsTable** which contains incremental integrals to expedite this calculation. The Cerenkov process in Geant4 is limited to normally dispersive media, i.e., dn(E)/dE≥0.

The time and position of Cerenkov photon emission are calculated from quantities known at the beginning of a charged particle’s step. The step is assumed to be rectilinear even in the presence of a magnetic field. The user may limit the step size by specifying a maximum (average) number of Cerenkov photons created during the step, using the **SetMaxNumPhotonsPerStep(const G4int NumPhotons)** method. The actual number generated will necessarily be different due to the Poissonian nature of the production. In the present implementation, the production density of photons is distributed evenly along the particle’s track segment, even if the particle has slowed significantly during the step. The step can also be limited with the **SetMaxBetaChangePerStep** method, where the argument is the allowed change in percent).

The frequently very large number of secondaries produced in a single step (about 300/cm in water), compelled the idea in GEANT3.21 of suspending the primary particle until all its progeny have been tracked. Despite the fact that Geant4 employs dynamic memory allocation and thus does not suffer from the limitations of GEANT3.21 with its fixed large initial ZEBRA store, Geant4 nevertheless provides for an analogous functionality with the public method **SetTrackSecondariesFirst**. 


```cpp
// Registration of the Cerenkov process in PhysicsList.¶
#include "G4Cerenkov.hh"

void ExptPhysicsList::ConstructOp(){

  G4Cerenkov*   theCerenkovProcess = new G4Cerenkov("Cerenkov");

  G4int MaxNumPhotons = 300;

  theCerenkovProcess->SetTrackSecondariesFirst(true);
  theCerenkovProcess->SetMaxBetaChangePerStep(10.0);
  theCerenkovProcess->SetMaxNumPhotonsPerStep(MaxNumPhotons);

  theParticleIterator->reset();
  while( (*theParticleIterator)() ){
    G4ParticleDefinition* particle = theParticleIterator->value();
    G4ProcessManager* pmanager = particle->GetProcessManager();
    G4String particleName = particle->GetParticleName();
    if (theCerenkovProcess->IsApplicable(*particle)) {
      pmanager->AddProcess(theCerenkovProcess);
      pmanager->SetProcessOrdering(theCerenkovProcess,idxPostStep);
    }
  }
}
```


## Scintillation

Every scintillating material has a characteristic light yield, **SCINTILLATIONYIELD**, and an intrinsic resolution, **RESOLUTIONSCALE**, which generally broadens the statistical distribution of generated photons. A wider intrinsic resolution is due to impurities which are typical for doped crystals like NaI(Tl) and CsI(Tl). On the other hand, the intrinsic resolution can also be narrower when the Fano factor plays a role. The actual number of emitted photons during a step fluctuates around the mean number of photons with a width given by **ResolutionScale x sqrt(MeanNumberOfPhotons)**. The average light yield, **MeanNumberOfPhotons**, has a linear dependence on the local energy deposition, but it may be different for minimum ionizing and non-minimum ionizing particles.

A scintillator is also characterized by its photon emission spectrum and by the exponential decay of its time spectrum. In Geant4 the scintillator can have a fast and a slow component. The relative strength of the fast component as a fraction of total scintillation yield is given by the **YIELDRATIO**. Scintillation may be simulated by specifying these empirical parameters for each material. It is sufficient to specify in the user’s **DetectorConstruction** class a relative spectral distribution as a function of photon energy for the scintillating material. 

```cpp
// Specification of scintillation properties in DetectorConstruction.
const G4int NUMENTRIES = 9;
G4double Scnt_PP[NUMENTRIES] = { 6.6*eV, 6.7*eV, 6.8*eV, 6.9*eV,
                                 7.0*eV, 7.1*eV, 7.2*eV, 7.3*eV, 7.4*eV };

G4double Scnt_FAST[NUMENTRIES] = { 0.000134, 0.004432, 0.053991, 0.241971,
                                   0.398942, 0.000134, 0.004432, 0.053991,
                                   0.241971 };
G4double Scnt_SLOW[NUMENTRIES] = { 0.000010, 0.000020, 0.000030, 0.004000,
                                   0.008000, 0.005000, 0.020000, 0.001000,
                                   0.000010 };

G4Material* Scnt;
G4MaterialPropertiesTable* Scnt_MPT = new G4MaterialPropertiesTable();

Scnt_MPT->AddProperty("FASTCOMPONENT", Scnt_PP, Scnt_FAST, NUMENTRIES);
Scnt_MPT->AddProperty("SLOWCOMPONENT", Scnt_PP, Scnt_SLOW, NUMENTRIES);

Scnt_MPT->AddConstProperty("SCINTILLATIONYIELD", 5000./MeV);
Scnt_MPT->AddConstProperty("RESOLUTIONSCALE", 2.0);
Scnt_MPT->AddConstProperty("FASTTIMECONSTANT",  1.*ns);
Scnt_MPT->AddConstProperty("SLOWTIMECONSTANT", 10.*ns);
Scnt_MPT->AddConstProperty("YIELDRATIO", 0.8);

Scnt->SetMaterialPropertiesTable(Scnt_MPT);
```


In cases where the scintillation yield of a scintillator depends on the particle type, different scintillation processes may be defined for them. How this yield scales to the one specified for the material is expressed with the **ScintillationYieldFactor** in the user’s **PhysicsList** as shown in the below. In those cases where the fast to slow excitation ratio changes with particle type, the method **SetScintillationExcitationRatio** can be called for each scintillation process (see the advanced underground_physics example). This overwrites the **YieldRatio** obtained from the **G4MaterialPropertiesTable**.

```cpp
// Implementation of the scintillation process in PhysicsList.¶
G4Scintillation* theMuonScintProcess = new G4Scintillation("Scintillation");

theMuonScintProcess->SetTrackSecondariesFirst(true);
theMuonScintProcess->SetScintillationYieldFactor(0.8);

theParticleIterator->reset();
while( (*theParticleIterator)() ){
  G4ParticleDefinition* particle = theParticleIterator->value();
  G4ProcessManager* pmanager = particle->GetProcessManager();
  G4String particleName = particle->GetParticleName();
  if (theMuonScintProcess->IsApplicable(*particle)) {
     if (particleName == "mu+") {
        pmanager->AddProcess(theMuonScintProcess);
        pmanager->SetProcessOrderingToLast(theMuonScintProcess, idxAtRest);
        pmanager->SetProcessOrderingToLast(theMuonScintProcess, idxPostStep);
     }
  }
}
```

A Gaussian-distributed number of photons is generated according to the energy lost during the step. A resolution scale of 1.0 produces a statistical fluctuation around the average yield set with **AddConstProperty("SCINTILLATIONYIELD")**, while values > 1 broaden the fluctuation. A value of zero produces no fluctuation. Each photon’s frequency is sampled from the empirical spectrum. The photons originate evenly along the track segment and are emitted uniformly into 4PI with a random linear polarization and at times characteristic for the scintillation component.

When there are multiple scintillators in the simulation and/or when the scintillation yield is a non-linear function of the energy deposited, the user can also define an array of total scintillation light yields as a function of the energy deposited and particle type. The available particles are protons, electrons, deuterons, tritons, alphas, and carbon ions. These are the particles known to significantly effect the scintillation light yield, of for example, BC501A (NE213/EJ301) liquid organic scintillator and BC420 plastic scintillator as function of energy deposited.

The method works as follows:

In the user’s physics lists, the user must set a G4bool flag that allows scintillation light emission to depend on the energy deposited by particle type:
```cpp
theScintProcess->SetScintillationByParticleType(true);
```
The user must also specify and add, via the AddProperty method of the MPT, the scintillation light yield as function of incident particle energy with new keywords, for example: PROTONSCINTILLATIONYIELD etc. and pairs of protonEnergy and scintLightYield.


## Wavelength Shifting


Wavelength Shifting (WLS) fibers are used in many high-energy particle physics experiments. They absorb light at one wavelength and re-emit light at a different wavelength and are used for several reasons. For one, they tend to decrease the self-absorption of the detector so that as much light reaches the PMTs as possible. WLS fibers are also used to match the emission spectrum of the detector with the input spectrum of the PMT.

A WLS material is characterized by its photon absorption and photon emission spectrum and by a possible time delay between the absorption and re-emission of the photon. Wavelength Shifting may be simulated by specifying these empirical parameters for each WLS material in the simulation. It is sufficient to specify in the user’s **DetectorConstruction** class a relative spectral distribution as a function of photon energy for the WLS material. **WLSABSLENGTH** is the absorption length of the material as a function of the photon’s energy. **WLSCOMPONENT** is the relative emission spectrum of the material as a function of the photon’s energy, and **WLSTIMECONSTANT** accounts for any time delay which may occur between absorption and re-emission of the photon. 


```cpp
// Specification of WLS properties in DetectorConstruction.
const G4int nEntries = 9;

G4double PhotonEnergy[nEntries] = { 6.6*eV, 6.7*eV, 6.8*eV, 6.9*eV,
                                  7.0*eV, 7.1*eV, 7.2*eV, 7.3*eV, 7.4*eV };

G4double RIndexFiber[nEntries] =
          { 1.60, 1.60, 1.60, 1.60, 1.60, 1.60, 1.60, 1.60, 1.60 };
G4double AbsFiber[nEntries] =
          {0.1*mm,0.2*mm,0.3*mm,0.4*cm,1.0*cm,10*cm,1.0*m,10.0*m,10.0*m};
G4double EmissionFiber[nEntries] =
          {0.0, 0.0, 0.0, 0.1, 0.5, 1.0, 5.0, 10.0, 10.0 };

G4Material* WLSFiber;
G4MaterialPropertiesTable* MPTFiber = new G4MaterialPropertiesTable();

MPTFiber->AddProperty("RINDEX",PhotonEnergy,RIndexFiber,nEntries);
MPTFiber->AddProperty("WLSABSLENGTH",PhotonEnergy,AbsFiber,nEntries);
MPTFiber->AddProperty("WLSCOMPONENT",PhotonEnergy,EmissionFiber,nEntries);
MPTFiber->AddConstProperty("WLSTIMECONSTANT", 0.5*ns);

WLSFiber->SetMaterialPropertiesTable(MPTFiber);
```

The process is defined in the PhysicsList in the usual way. The process class name is **G4OpWLS**. It should be instantiated with **theWLSProcess = new G4OpWLS(“OpWLS”)** and attached to the process manager of the optical photon as a DiscreteProcess. The way the **WLSTIMECONSTANT** is used depends on the time profile method chosen by the user. If in the PhysicsList **theWLSProcess->UseTimeGenerator(“exponential”)** option is set, the time delay between absorption and re-emission of the photon is sampled from an exponential distribution, with the decay term equal to WLSTIMECONSTANT. If, on the other hand, **theWLSProcess->UseTimeGenerator(“delta”)** is chosen, the time delay is a delta function and equal to **WLSTIMECONSTANT**. The default is “delta” in case the **G4OpWLS::UseTimeGenerator(const G4String name)** method is not used.


-----

## Absorption

The implementation of optical photon **bulk absorption, G4OpAbsorption**, is trivial in that the process merely kills the particle. The procedure requires the user to fill the relevant **G4MaterialPropertiesTable** with empirical data for the absorption length, using **ABSLENGTH** as the property key in the public method **AddProperty**. The absorption length is the average distance traveled by a photon before being absorbed by the medium; i.e. it is the mean free path returned by the **GetMeanFreePath** method.


## Rayleigh Scattering

The differential cross section in Rayleigh scattering, dσ/dΩ, is proportional to 1+cos2θ, where θ is the polar of the new polarization vector with respect to the old polarization vector. The **G4OpRayleigh** scattering process samples this angle accordingly and then calculates the scattered photon’s new direction by requiring that it be perpendicular to the photon’s new polarization in such a way that the final direction, initial and final polarizations are all in one plane. This process thus depends on the particle’s polarization (spin). The photon’s polarization is a data member of the **G4DynamicParticle** class.

A photon which is not assigned a polarization at production, either via the **SetPolarization** method of the **G4PrimaryParticle** class, or indirectly with the **SetParticlePolarization** method of the **G4ParticleGun** class, may not be Rayleigh scattered. Optical photons produced by the **G4Cerenkov** process have inherently a polarization perpendicular to the cone’s surface at production. Scintillation photons have a random linear polarization perpendicular to their direction.

The process requires a **G4MaterialPropertiesTable** to be filled by the user with Rayleigh scattering length data. The Rayleigh scattering attenuation length is the average distance traveled by a photon before it is Rayleigh scattered in the medium and it is the distance returned by the **GetMeanFreePath** method. The **G4OpRayleigh** class provides a **RayleighAttenuationLengthGenerator** method which calculates the attenuation coefficient of a medium following the Einstein-Smoluchowski formula whose derivation requires the use of statistical mechanics, includes temperature, and depends on the isothermal compressibility of the medium. This generator is convenient when the Rayleigh attenuation length is not known from measurement but may be calculated from first principles using the above material constants. For a medium named Water and no Rayleigh scattering attenuation length specified by the user, the program automatically calls the **RayleighAttenuationLengthGenerator** which calculates it for 10 degrees Celsius liquid water.


## Mie Scattering

Mie Scattering (or Mie solution) is an analytical solution of Maxwell’s equations for scattering of optical photons by spherical particles. It is significant only when the radius of the scattering object is of order of the wave length. The analytical expressions for Mie Scattering are very complicated since they are a series sum of Bessel functions. One common approximation made is call Henyey-Greenstein (HG). The implementation in Geant4 follows the HG approximation (for details see the Physics Reference Manual) and the treatment of polarization and momentum are similar to that of Rayleigh scattering. We require the final polarization direction to be perpendicular to the momentum direction. We also require the final momentum, initial polarization and final polarization to be in the same plane.

The process requires a G4MaterialPropertiesTable to be filled by the user with Mie scattering length data (entered with the name: MIEHG) analogous to Rayleigh scattering. The Mie scattering attenuation length is the average distance traveled by a photon before it is Mie scattered in the medium and it is the distance returned by the GetMeanFreePath method. In practice, the user not only needs to provide the attenuation length of Mie scattering, but also needs to provide the constant parameters of the approximation: **g\_f**, **g\_b**, and **r\_f**.  (with **AddConstProperty** and with the names: **MIEHG\_FORWARD**, **MIEHG\_BACKWARD**, and **MIEHG\_FORWARD\_RATIO**, respectively; see Novice Example N06.)


-----

## UNIFIED model



## Look-up-tables (LUTs)

文献：
- 2010
	- [Simulating Scintillator Light Collection Using Measured Optical Reflectance](http://wuhongyi.cn/Geant4Note/pdf/article/optical/05485130.pdf)
- 2013
	- [Simulation of light transport in scintillators based on 3D characterization of crystal surfaces](http://wuhongyi.cn/Geant4Note/pdf/article/optical/Roncali_2013_Phys._Med._Biol._58_2185.pdf)
- 2017
	- [An integrated model of scintillator-reflector properties for advanced simulations of optical transport](http://wuhongyi.cn/Geant4Note/pdf/article/optical/Roncali_2017_Phys._Med._Biol._62_4811.pdf)
	- [Advanced optical simulation of scintillation detectors in GATE V8.0: first implementation of a reflectance model based on measured data](http://wuhongyi.cn/Geant4Note/pdf/article/optical/Stockhoff_2017_Phys._Med._Biol._62_L1.pdf)







<!-- OpticalPhoton.md ends here -->
