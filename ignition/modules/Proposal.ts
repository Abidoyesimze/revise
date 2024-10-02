import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";


const ProposalModule = buildModule("ProposalModule", (m) => {

  const proposal = m.contract("Proposals");

  return { proposal };
});

export default ProposalModule;
