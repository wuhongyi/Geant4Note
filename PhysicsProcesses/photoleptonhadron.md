<!-- photoleptonhadron.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 12月 23 22:19:29 2017 (+0800)
;; Last-Updated: 一 5月 21 09:15:14 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 2
;; URL: http://wuhongyi.cn -->

# photolepton-hadron

> http://geant4-userdoc.web.cern.ch/geant4-userdoc/UsersGuides/ForApplicationDeveloper/html/TrackingAndPhysics/physicsProcess.html#gamma-nuclear-and-lepto-nuclear-processes


Gamma-nuclear and lepto-nuclear reactions are handled in Geant4 as hybrid processes which typically require both electromagnetic and hadronic models for their implementation. While neutrino-induced reactions are not currently provided, the Geant4 hadronic framework is general enough to include their future implementation as a hybrid of weak and hadronic models.

The general scheme followed is to factor the full interaction into an electromagnetic (or weak) vertex, in which a virtual particle is generated, and a hadronic vertex in which the virtual particle interacts with a target nucleus. In most cases the hadronic vertex is implemented by an existing Geant4 model which handles the intra-nuclear propagation.

The cross sections for these processes are parameterizations, either directly of data or of theoretical distributions determined from the integration of lepton-nucleon cross sections double differential in energy loss and momentum transfer.




For the most part gammas can be treated as hadrons and in fact they interact that way with the nucleus when the Bertini-style cascade **G4CascadeInterface** and QGSP models are used. These models may be assigned to **G4PhotoNuclearProcess** as shown in the following partial code:

```cpp
G4TheoFSGenerator* theHEModel = new G4TheoFSGenerator;
G4QGSModel* theStringModel = new G4QGSModel<G4GammaParticipants>;
G4ExcitedStringDecay* theStringDecay =
  new G4ExcitedStringDecay(theFragmentation=new G4QGSMFragmentation);
theStringModel->SetFragmentationModel(theStringDecay);

theHEModel->SetHighEnergyGenerator(theStringModel);
theHEModel->SetTransport(new G4GeneratorPrecompoundInterface);
theHEModel->SetMinEnergy(8*GeV);

G4CascadeInterface* theLEModel = new G4CascadeInterface;
theLEModel->SetMaxEnergy(10*GeV);

G4PhotoNuclearProcess* thePhotoNuclearProcess = new G4PhotoNuclearProcess;
thePhotoNuclearProcess->RegisterMe(theLEModel);
thePhotoNuclearProcess->RegisterMe(theHEModel);

G4ProcessManager* procMan = G4Gamma::Gamma()->GetProcessManager();
procMan->AddDiscreteProcess(thePhotoNuclearProcess);
```


Electro-nuclear reactions in Geant4 are handled by the classes **G4ElectronNuclearProcess** and **G4PositronNuclearProcess**, which are both implmented by **G4ElectroVDNuclearModel**. This model consists of three sub-models: code which generates the virtual photon from the lepton-nucleus vertex, the Bertini-style cascade to handle the low and medium energy photons, and the FTFP model to handle the high energy photons.

Muon-nuclear reactions are handled similarly. The process **G4MuonNuclearProcess** can be assigned the **G4MuonVDNuclearModel** which in turn is implemented by three sub-models: virtual gamma generation code, Bertini-style cascade and the FTFP model.






<!-- photoleptonhadron.md ends here -->
