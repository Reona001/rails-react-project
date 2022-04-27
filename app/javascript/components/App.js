// first react component

import React from 'react'
import Airlines from './Airlines/Airlines'
import Airline from './Airline/Airline'
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom'

class App extends React.Component{
  render () {
    return (
    <div>
      <Routes>
        <Route path="/" element={<Airlines /> } />
        <Route exact path="/airlines/:slug" element={<Airline />}/>
      </Routes>
    </div>
   )
  }
}

export default App
