import React, { Component } from 'react';
import { Button, Input, Table } from 'semantic-ui-react'
import { createContract } from './../ethereum/VotingContract'
import { web3 } from './../ethereum/web3'

export class Voting extends Component {

  ONGOING_STATE = '0'
  FAILED_STATE = '1'
  SUCCEEDED_STATE = '2'

  state = {
    winner: {
      name: 'N/A',
      id: ''
      state: ''
    },
  }

  constructor(props) {
    super(props)

    this.onContribute = this.onContribute.bind(this)
  }

  async componentDidMount() {
    const currentCampaign = await this.getCampaign(this.getCampaignAddress())
    this.setState({
      campaign: currentCampaign
    })
  }

  getUserAddress() {
    return this.props.match.params.address
  }

  async getVoting(address) {
    const contract = createContract(address)

    // Coleta os dados da Blockchain
    const name = await contract.methods.name().call()
    const id = await contract.methods.id().call()
    const state = await contract.methods.state().call()

    const accounts = await web3.eth.getAccounts(console.log)

    console.log(accounts)
    
    // Retorna os dados da Blockchain
    return {
      name: name,
      targetAmount: targetAmount,
      totalCollected: totalCollected,
      campaignFinished: !beforeDeadline,
      deadline: deadlineDate,
      isBeneficiary: beneficiary.toLowerCase() === accounts[0].toLowerCase(),
      state: state
    }
  }

  // Monta a tabela com os dados do contrato
  render() {
    return (
      <div>
        <Table celled padded color="teal" striped>
          <Table.Header>
            <Table.Row>
              <Table.HeaderCell>Nome</Table.HeaderCell>
              <Table.HeaderCell>Valor</Table.HeaderCell>
            </Table.Row>
          </Table.Header>

          <Table.Body>

            <Table.Row>
              <Table.Cell singleLine>
                Título do Leilão
              </Table.Cell>
              <Table.Cell singleLine>
                {this.state.campaign.name}
              </Table.Cell>
            </Table.Row>

            <Table.Row>
              <Table.Cell singleLine>
                Total Objetivo
              </Table.Cell>
              <Table.Cell singleLine>
                {this.state.campaign.targetAmount}
              </Table.Cell>
            </Table.Row>

            <Table.Row>
              <Table.Cell singleLine>
                Total Arrecadado
              </Table.Cell>
              <Table.Cell singleLine>
                {this.state.campaign.totalCollected}
              </Table.Cell>
            </Table.Row>

            <Table.Row>
              <Table.Cell singleLine>
                Leilão Encerrado
              </Table.Cell>
              <Table.Cell singleLine>
                {this.state.campaign.campaignFinished.toString()}
              </Table.Cell>
            </Table.Row>


            <Table.Row>
              <Table.Cell singleLine>
                Data de Término do Leilão
              </Table.Cell>
              <Table.Cell singleLine>
                {this.state.campaign.deadline.toString()}
              </Table.Cell>
            </Table.Row>

            <Table.Row>
              <Table.Cell singleLine>
                Eu sou o Beneficiário
              </Table.Cell>
              <Table.Cell singleLine>
                {this.state.campaign.isBeneficiary.toString()}
              </Table.Cell>
            </Table.Row>

            <Table.Row>
              <Table.Cell singleLine>
                Estado do Contrato
              </Table.Cell>
              <Table.Cell singleLine>
                {this.state.campaign.state}
              </Table.Cell>
            </Table.Row>
