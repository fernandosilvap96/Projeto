import React, { Component } from 'react'
import Web3 from 'web3'
import './App.css'
import { nome do CONTRACT_ABI, nome do CONTRACT_ADDRESS } from './config'
import React from 'react'
import { Form } from 'semantic-ui-react'

class App extends Component {
  componentWillMount() {
    this.loadBlockchainData()
  }

  async loadBlockchainData() {
    const web3 = new Web3(Web3.givenProvider || "http://localhost:7545")
    const accounts = await web3.eth.getAccounts()
    this.setState({ account: accounts[0] })
    const voting = new web3.eth.Contract(nome do Contract_ABI, nome do Contract_ADDRESS)
    this.setState({ voting })
    const votes = await voting.methods.votes().call()
    this.setState({ votes })
    const getOption = await voting.methods.getOption().call()	
    }
  }	

  constructor(props) {
    super(props)
    this.state = {
      account: '',
      taskCount: 0,
      tasks: []
    }
  }

  render() {
    return (
        <Form>
    	 <Form.Field>
      	  <label>User Input</label>
          <input />
   	 </Form.Field>
  	</Form>
    })
}

export default App;