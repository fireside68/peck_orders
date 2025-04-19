interface ErrorBannerProps {
  message: string;
}

export const ErrorBanner = ({ message }: ErrorBannerProps) => {
  return (
    <>
      <div className="bg-red-100 text-red-800 px-4 py-3 rounded-md shadow-md my-4 border border-red-300">
        <p className="text-sm font-medium">🚫 {message}</p>
      </div>
    </>
  );
};