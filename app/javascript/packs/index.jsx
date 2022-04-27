// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.
import ReactDOM from 'react-dom'
import React from 'react'
import PropTypes from 'prop-types'
import App from '../components/App'
import { Routes } from 'react-router-dom'


document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Router>
      <Routes>
        <Route path="*" element={<App />}>,</Route>
      </Routes>
    </Router>,
    document.body.appendChild(document.createElement('div')),
  )
})

// issue: ReactDOM not loading App.js component for root path "/"
// already used yar to add react-router-dom
