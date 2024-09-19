import './bootstrap';

// importing alphinejs in the app.js
import Alpine from 'alpinejs'
import Intersect from '@alpinejs/intersect'

Alpine.plugin(Intersect)
Alpine.start()

window.Alpine = Alpine
// end-line