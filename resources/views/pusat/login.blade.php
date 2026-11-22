<form action="/pusat/login" method="POST">
    @csrf
    <h2>LOGIN KHUSUS SUPERADMIN</h2>
    <input type="text" name="username" placeholder="Username" required>
    <input type="password" name="password" placeholder="Password" required>
    <button type="submit">Masuk ke Panel Pusat</button>
</form>