// first react component

import React from 'react'
import Airlines from './Airlines/Airlines'
import Airline from './Airline/Airline'
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom'

const App = () => {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<Airlines /> } />
        <Route exact path="/airlines/:slug" component={Airline}/>
      </Routes>
    </Router>
  )
}

export default App
